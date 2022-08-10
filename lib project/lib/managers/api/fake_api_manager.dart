

import 'package:eq_works_task/managers/api/i_api_manager.dart';
import 'package:eq_works_task/models/location_event.dart';

class FakeApiManager implements IApiManager{
  @override
  Future<bool> sendLocationEvent(LocationEvent locationEvent) async{
    print('FakeApiManager sending locationEvent => $locationEvent');
    return true;
  }

}