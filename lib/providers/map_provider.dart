import 'package:ceritakita/services/location_repository.dart';
import 'package:flutter/cupertino.dart';

class MapProvider extends ChangeNotifier {
  MapProvider({required LocationRepository locationRepository})
    : _locationRepository = locationRepository;

  final LocationRepository _locationRepository;

  static const double defaultLat = -6.2088;
  static const double defaultLon = 106.8456;

  double? pickerLat;
  double? pickerLon;
  bool isPickerReady = false;

  double? selectedLat;
  double? selectedLon;
  String? selectedAddress;
  bool isResolvingAddress = false;

  double? _pickerInitialLat;
  double? _pickerInitialLon;

  final Map<String, String> _addressCache = {};

  bool get hasSelectedLocation => selectedLat != null && selectedLon != null;

  bool get hasPickerPosition => pickerLat != null && pickerLon != null;

  void preparePicker({double? initialLat, double? initialLon}) {
    _pickerInitialLat = initialLat;
    _pickerInitialLon = initialLon;
  }

  Future<void> initPicker() async {
    isPickerReady = false;
    notifyListeners();

    final initialLat = _pickerInitialLat;
    final initialLon = _pickerInitialLon;

    if (initialLat != null && initialLon != null) {
      pickerLat = initialLat;
      pickerLon = initialLon;
    } else {
      final location = await _locationRepository.getCurrentLocation();
      pickerLat = location?.lat ?? defaultLat;
      pickerLon = location?.lon ?? defaultLon;
    }

    isPickerReady = true;
    notifyListeners();
  }

  void updatePickerPosition(double lat, double lon) {
    pickerLat = lat;
    pickerLon = lon;
  }

  Future<void> applyPickerAsSelection() async {
    if (pickerLat == null || pickerLon == null) return;
    await setSelectedLocation(pickerLat!, pickerLon!);
  }

  Future<void> setSelectedLocation(double lat, double lon) async {
    selectedLat = lat;
    selectedLon = lon;
    selectedAddress = null;
    isResolvingAddress = true;
    notifyListeners();

    final address = await _locationRepository.getAddress(lat, lon);
    selectedAddress = address.isNotEmpty ? address : null;
    isResolvingAddress = false;
    notifyListeners();
  }

  void clearSelectedLocation() {
    selectedLat = null;
    selectedLon = null;
    selectedAddress = null;
    isResolvingAddress = false;
    notifyListeners();
  }

  Future<String> getAddress(double lat, double lon) async {
    final key = '${lat.toStringAsFixed(5)}_${lon.toStringAsFixed(5)}';
    final cached = _addressCache[key];
    if (cached != null) {
      return cached;
    }

    final address = await _locationRepository.getAddress(lat, lon);
    _addressCache[key] = address;
    return address;
  }

  String locationDisplayLabel({
    required String addLocationLabel,
    required String loadingAddressLabel,
    required String addressUnavailableLabel,
  }) {
    if (isResolvingAddress) {
      return loadingAddressLabel;
    }

    if (hasSelectedLocation && selectedAddress != null) {
      return selectedAddress!;
    }

    if (hasSelectedLocation) {
      return addressUnavailableLabel;
    }

    return addLocationLabel;
  }
}
