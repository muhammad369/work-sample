import 'package:eq_works_task/managers/api/fake_api_manager.dart';
import 'package:eq_works_task/managers/api/i_api_manager.dart';
import 'package:eq_works_task/models/location_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:eq_works_task/eq_works_task.dart';
import 'package:get_it/get_it.dart';

void main() {
  test('library setup()', () {
    final lib = Library();
    expect(true, lib.setup());
  });

  test('library log()', () async {
    final lib = Library();
    // setup fake dependencies
    GetIt.I.reset();
    GetIt.I.registerLazySingleton<IApiManager>(() => FakeApiManager());
    //
    await lib.log(LocationEvent(ext: 'empty', lat: 0, lon: 0));
  });


}
