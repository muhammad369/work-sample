import 'package:eq_works_task/managers/api/api_manager.dart';
import 'package:eq_works_task/managers/api/i_api_manager.dart';
import 'package:eq_works_task/services/connectivity/connectivity_service.dart';
import 'package:eq_works_task/services/connectivity/i_connectivity_service.dart';
import 'package:eq_works_task/services/http/dio_http_service.dart';
import 'package:eq_works_task/services/http/i_http_service.dart';
import 'package:eq_works_task/services/location/i_location_service.dart';
import 'package:eq_works_task/services/location/location_service.dart';
import 'package:get_it/get_it.dart';


void setupDependencies() {
  GetIt.I.registerLazySingleton<IConnectivityService>(() => ConnectivityService());
  GetIt.I.registerLazySingleton<IHttpService>(() => DioHttpService());
  GetIt.I.registerLazySingleton<ILocationService>(() => LocationService());
  GetIt.I.registerLazySingleton<IApiManager>(() => ApiManager(GetIt.I.get(), GetIt.I.get()));
}
