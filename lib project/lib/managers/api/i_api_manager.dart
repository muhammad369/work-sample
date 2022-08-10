
import 'package:eq_works_task/models/location_event.dart';

abstract class IApiManager{

  Future<bool> sendLocationEvent(LocationEvent locationEvent);

}