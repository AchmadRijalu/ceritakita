enum AppFlavor { free, paid }

class AppFlavorConfig {
  AppFlavorConfig._();

  static AppFlavor _flavor = AppFlavor.free;

  static AppFlavor get flavor => _flavor;

  static bool get isFree => _flavor == AppFlavor.free;

  static bool get isPaid => _flavor == AppFlavor.paid;

  static bool get canAddStoryLocation => isPaid;

  static void init(AppFlavor flavor) {
    _flavor = flavor;
  }

  static String appTitle(String baseTitle) {
    return switch (_flavor) {
      AppFlavor.free => '$baseTitle (Free)',
      AppFlavor.paid => '$baseTitle (Paid)',
    };
  }
}
