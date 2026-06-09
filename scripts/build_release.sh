#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

PLATFORM="${1:-android}"

echo "Building CeritaKita release for: $PLATFORM"
flutter pub get

case "$PLATFORM" in
  android)
    if [[ ! -f android/key.properties ]]; then
      echo ""
      echo "No android/key.properties found."
      echo "Release APK will be signed with the debug key (fine for local testing)."
      echo "For production signing:"
      echo "  1. cp android/key.properties.example android/key.properties"
      echo "  2. Generate a keystore:"
      echo "     keytool -genkey -v -keystore android/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload"
      echo "  3. Fill in android/key.properties"
      echo ""
    fi

    flutter build apk --release
    echo ""
    echo "APK ready:"
    echo "  build/app/outputs/flutter-apk/app-release.apk"
    echo ""
    echo "Install on a connected device:"
    echo "  flutter install --release"
    ;;

  android-bundle)
    flutter build appbundle --release
    echo ""
    echo "AAB ready:"
    echo "  build/app/outputs/bundle/release/app-release.aab"
    ;;

  ios)
    flutter build ios --release
    echo ""
    echo "iOS release build complete."
    echo "Open ios/Runner.xcworkspace in Xcode, select your real device,"
    echo "then Product > Archive to install or distribute."
    ;;

  *)
    echo "Usage: ./scripts/build_release.sh [android|android-bundle|ios]"
    exit 1
    ;;
esac
