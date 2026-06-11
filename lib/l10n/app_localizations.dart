import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Cerita Kita'**
  String get appTitle;

  /// No description provided for @helloThere.
  ///
  /// In en, this message translates to:
  /// **'Hello There!'**
  String get helloThere;

  /// No description provided for @signInToContinue.
  ///
  /// In en, this message translates to:
  /// **'Sign in to Continue'**
  String get signInToContinue;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get emailInvalid;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordMin6.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMin6;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @joinCommunity.
  ///
  /// In en, this message translates to:
  /// **'Join our community of storytellers and start sharing your journey today.'**
  String get joinCommunity;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @enterFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get enterFullName;

  /// No description provided for @fullNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name is required'**
  String get fullNameRequired;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'name@example.com'**
  String get emailHint;

  /// No description provided for @passwordMin8.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get passwordMin8;

  /// No description provided for @atLeast8Characters.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get atLeast8Characters;

  /// No description provided for @registerFailed.
  ///
  /// In en, this message translates to:
  /// **'Register Failed'**
  String get registerFailed;

  /// No description provided for @registrationSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Registration successful'**
  String get registrationSuccessful;

  /// No description provided for @stories.
  ///
  /// In en, this message translates to:
  /// **'Stories'**
  String get stories;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @addStory.
  ///
  /// In en, this message translates to:
  /// **'Add Story'**
  String get addStory;

  /// No description provided for @hiWelcome.
  ///
  /// In en, this message translates to:
  /// **'Hi, Welcome!'**
  String get hiWelcome;

  /// No description provided for @failedToLoadStories.
  ///
  /// In en, this message translates to:
  /// **'Failed to load stories'**
  String get failedToLoadStories;

  /// No description provided for @noStoriesYet.
  ///
  /// In en, this message translates to:
  /// **'No stories yet'**
  String get noStoriesYet;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @oops.
  ///
  /// In en, this message translates to:
  /// **'Oops!'**
  String get oops;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get somethingWentWrong;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Please check your network and try again.'**
  String get noInternetConnection;

  /// No description provided for @storyDetail.
  ///
  /// In en, this message translates to:
  /// **'Story Detail'**
  String get storyDetail;

  /// No description provided for @failedToLoadStory.
  ///
  /// In en, this message translates to:
  /// **'Failed to load story'**
  String get failedToLoadStory;

  /// No description provided for @addStoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Story'**
  String get addStoryTitle;

  /// No description provided for @snapOrSelect.
  ///
  /// In en, this message translates to:
  /// **'Snap or select'**
  String get snapOrSelect;

  /// No description provided for @addVisualHint.
  ///
  /// In en, this message translates to:
  /// **'Add a high-quality visual to your story'**
  String get addVisualHint;

  /// No description provided for @openCamera.
  ///
  /// In en, this message translates to:
  /// **'Open Camera'**
  String get openCamera;

  /// No description provided for @fromGallery.
  ///
  /// In en, this message translates to:
  /// **'From Gallery'**
  String get fromGallery;

  /// No description provided for @headline.
  ///
  /// In en, this message translates to:
  /// **'Headline'**
  String get headline;

  /// No description provided for @headlineHint.
  ///
  /// In en, this message translates to:
  /// **'Give your story a catchy title...'**
  String get headlineHint;

  /// No description provided for @headlineRequired.
  ///
  /// In en, this message translates to:
  /// **'Headline is required'**
  String get headlineRequired;

  /// No description provided for @theStory.
  ///
  /// In en, this message translates to:
  /// **'The Story'**
  String get theStory;

  /// No description provided for @storyRequired.
  ///
  /// In en, this message translates to:
  /// **'Story is required'**
  String get storyRequired;

  /// No description provided for @storyHint.
  ///
  /// In en, this message translates to:
  /// **'Once upon a time...'**
  String get storyHint;

  /// No description provided for @pleaseSelectPhoto.
  ///
  /// In en, this message translates to:
  /// **'Please select a photo first'**
  String get pleaseSelectPhoto;

  /// No description provided for @uploadStory.
  ///
  /// In en, this message translates to:
  /// **'Upload Story'**
  String get uploadStory;

  /// No description provided for @storyUploadedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Story uploaded successfully'**
  String get storyUploadedSuccessfully;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @indonesian.
  ///
  /// In en, this message translates to:
  /// **'Indonesian'**
  String get indonesian;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
