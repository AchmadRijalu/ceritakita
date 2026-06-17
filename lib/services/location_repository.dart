import 'package:ceritakita/shared/location_helper.dart' as location_helper;

class LocationRepository {
  Future<({double lat, double lon})?> getCurrentLocation() {
    return location_helper.getCurrentLocation();
  }

  Future<String> getAddress(double lat, double lon) {
    return location_helper.addressFromCoordinates(lat, lon);
  }
}
