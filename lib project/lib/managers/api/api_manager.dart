import 'package:eq_works_task/managers/api/i_api_manager.dart';
import 'package:eq_works_task/models/location_event.dart';
import 'package:eq_works_task/services/connectivity/i_connectivity_service.dart';
import 'package:eq_works_task/services/http/http_classes.dart';
import 'package:eq_works_task/services/http/i_http_service.dart';

class ApiManager implements IApiManager {
  final IHttpService _httpService;
  final IConnectivityService _connectivityService;

  ApiManager(this._connectivityService, this._httpService);

  @override
  Future<bool> sendLocationEvent(LocationEvent locationEvent) async {
    if (!(await _connectivityService.isConnected())) return false;
    //
    var resp = await _httpService
        .sendRequest(HttpRequest(method: HttpMethod.post, url: '', data: locationEvent)..addJsonHeaders());
    //
    if(resp?.statusCode != 200) return false;
    //
    return true;
  }
}
