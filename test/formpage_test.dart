import 'package:bucketapp/pages/form.dart';
import 'package:bucketapp/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FormPage Widget Tests', () {
    testWidgets('Widgets Render Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: FormPage()));

      expect(find.byType(FormPage), findsOneWidget);
      expect(find.text('Bucket X'), findsOneWidget);
      expect(find.text('Bucket Y'), findsOneWidget);
      expect(find.text('Desired Measure'), findsOneWidget);
      expect(find.text('CALCULATE'), findsOneWidget);
    });
  });

  testWidgets('Submit Form Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: FormPage()));

    await tester.enterText(find.byKey(Key('x_field')), '2');
    await tester.enterText(find.byKey(Key('y_field')), '10');
    await tester.enterText(find.byKey(Key('z_field')), '4');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byType(ResultPage), findsOneWidget);
  });
}
