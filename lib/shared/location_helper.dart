import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

bool hasValidLocation(double? lat, double? lon) {
  return lat != null && lon != null;
}

Future<({double lat, double lon})?> getCurrentLocation() async {
  final serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return null;
  }

  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    return null;
  }

  final position = await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
    ),
  );

  return (lat: position.latitude, lon: position.longitude);
}

Future<String> addressFromCoordinates(double lat, double lon) async {
  try {
    final placemarks = await placemarkFromCoordinates(lat, lon);
    if (placemarks.isEmpty) {
      return '';
    }

    final place = placemarks.first;
    return [
      place.street,
      place.subLocality,
      place.locality,
      place.administrativeArea,
      place.country,
    ].where((part) => part != null && part.isNotEmpty).join(', ');
  } catch (_) {
    return '';
  }
}
