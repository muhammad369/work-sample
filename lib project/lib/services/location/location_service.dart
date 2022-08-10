import 'package:geolocator/geolocator.dart';
import 'i_location_service.dart';

class LocationService implements ILocationService {
  @override
  Future<LatLng?> getCurrentLocation([int accuracy = 1]) async {
    Position? position;
    //
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: accuracy == 1
              ? LocationAccuracy.best
              : accuracy == 2
              ? LocationAccuracy.high
              : accuracy == 3
              ? LocationAccuracy.medium
              : accuracy == 4
              ? LocationAccuracy.low
              : LocationAccuracy.lowest,
          timeLimit: const Duration(seconds: 30));

    }
    catch (err){
      print(err);
      return null;
    }
    //
    if (position == null) return null;
    //
    var loc = LatLng(lat: position.latitude, lng: position.longitude);
    print('current location => $loc');
    return loc;
  }

  @override
  Future<bool> get isPermissionGranted async {
    LocationPermission permission = await Geolocator.checkPermission();
    print('check location permission => $permission');
    return (permission == LocationPermission.whileInUse || permission == LocationPermission.always);
  }

  @override
  Future<bool> requestPermission() async {
    var permission = await Geolocator.requestPermission();
    print('request location permission => $permission');
    return (permission == LocationPermission.whileInUse || permission == LocationPermission.always);
  }

  @override
  Future<bool> get isServiceEnabled async {
    var enabled = await Geolocator.isLocationServiceEnabled();
    print('check location service => $enabled');
    return enabled;
  }

  @override
  Future<LatLng?> getLastKnownLocation() async {
    Position? position = await Geolocator.getLastKnownPosition();
    var loc = position == null ? null : LatLng(lat: position.latitude, lng: position.longitude);
    print('last known location => $loc');
    return loc;
  }

  @override
  Future<bool> requestEnableService() {
    return Geolocator.openLocationSettings();
  }
}
