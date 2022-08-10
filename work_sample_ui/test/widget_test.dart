// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:work_sample_ui/main.dart';

void main() {
  testWidgets('library, getLocation and send to API', (WidgetTester tester) async {
    await tester.runAsync(() async {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();
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
