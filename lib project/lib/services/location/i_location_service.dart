abstract class ILocationService {

  /// accuracy takes values from 1: best -> 5: lowest
  Future<LatLng?> getCurrentLocation([int accuracy=1]);

  Future<LatLng?> getLastKnownLocation();

  Future<bool> get isPermissionGranted;

  Future<bool> requestPermission();

  Future<bool> get isServiceEnabled;

  Future<bool> requestEnableService();
}

class LatLng {
  late double lng, lat;

  LatLng({required this.lat, required this.lng});

  @override
  String toString() {
    return '(lat: $lat - lng: $lng)';
  }
}
