library eq_works_task;

import 'package:eq_works_task/managers/api/i_api_manager.dart';
import 'package:eq_works_task/models/location_event.dart';
import 'package:eq_works_task/services/location/i_location_service.dart';
import 'package:eq_works_task/setup_dependencies.dart';
import 'package:get_it/get_it.dart';

/// A Calculator.
class Library {
  bool setup() {
    setupDependencies();
    return true;
  }

  Future<LatLng> getLocation() async {
    var _locationService = GetIt.I.get<ILocationService>();
    LatLng? location = null;
    //
    if (await _locationService.isPermissionGranted) {
      if (await _locationService.isServiceEnabled) {
        for (int i = 1; i <= 5; i++) {
          location = await _locationService.getCurrentLocation(i);
          if (location != null) break;
        }
      }
      //
      if (location == null) {
        location = await _locationService.getLastKnownLocation();
      }
    }
    // if still location null
    if (location == null) {
      location = LatLng(lat: 0, lng: 0);
    }
    //
    return location;
  }

  Future<void> log(LocationEvent locationEvent) async {
    locationEvent.time ??= DateTime.now().millisecondsSinceEpoch;
    //
    var _apiManager = GetIt.I.get<IApiManager>();
    await _apiManager.sendLocationEvent(locationEvent);
  }
}
