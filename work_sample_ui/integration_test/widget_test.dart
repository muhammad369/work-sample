
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:work_sample_ui/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('library, getLocation and send to API', (WidgetTester tester) async {
    await tester.runAsync(() async {

      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());
      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      //
      await Future.delayed(const Duration(seconds: 60));
      await tester.pump();

      // Verify that the word 'success' appeared
      expect(find.text('success'), findsOneWidget);
    });
  });
}
