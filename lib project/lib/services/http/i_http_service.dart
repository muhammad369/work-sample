
import 'package:eq_works_task/util/serialization/serialization_lib.dart';

import 'http_classes.dart';

abstract class IHttpService{

  Future<HttpResponse?> sendRequest(HttpRequest<Serializable> request);

  //void addMonitor(HttpMonitor monitor, [int? index]);
  void setTimeout(int seconds);

}

