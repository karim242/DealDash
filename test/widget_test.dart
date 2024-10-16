// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dealdash/app.dart';
import 'package:dealdash/feature/home/presentation/view/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });



  // testWidgets('Test bottom navigation and screen switching', (WidgetTester tester) async {
  //   await tester.pumpWidget(const MaterialApp(
  //     home: RootView(),
  //   ));

  //       expect(find.byIcon(Icons.home), findsOneWidget);

  //   // النقر على زر Favorite
  //   await tester.tap(find.byIcon(Icons.favorite));
  //   await tester.pump();

  //   // التحقق من عرض FavoriteView
  //   expect(find.text('Favorite'), findsOneWidget); // يفترض أن يكون هناك نص متعلق بـ FavoriteView

  //   // النقر على زر Location
  //   await tester.tap(find.byIcon(Icons.location_on));
  //   await tester.pump();

  //   // التحقق من عرض LocationView (إذا كان الموقع متاحًا)
  //   expect(find.byIcon(Icons.location_on), findsOneWidget);

  //   // النقر على زر Notifications
  //   await tester.tap(find.byIcon(Icons.notifications));
  //   await tester.pump();

  //   // التحقق من عرض NotificationView
  //   expect(find.text('Notify'), findsOneWidget);

  //   // النقر على زر Profile
  //   await tester.tap(find.byIcon(Icons.person));
  //   await tester.pump();

  //   // التحقق من عرض ProfileView
  //   expect(find.text('Profile'), findsOneWidget);
  // });
}

