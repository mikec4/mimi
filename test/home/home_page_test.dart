import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/home/homeProvider/home_provider.dart';
import 'package:mimi/home/pages/home_page.dart';
import 'package:provider/provider.dart';

void main(){

  Widget _homePage(Widget child){
    return ChangeNotifierProvider<HomeProvider>(
      builder: (_) => HomeProvider(),
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets(('Home page'), (WidgetTester tester) async {

    final datePickerKey = Key('DatePicker');
    final originalLocationKey = Key('From');
    final destinationKey = Key('Destination');
    final searchButtonKey = Key('SEARCH');
    final yaiKey = Key('Yai');
    final welcomeHeaderKey = Key('Where');

    
      await tester.pumpWidget(_homePage(HomePage()));
      
      tester.widget(find.byKey(yaiKey));
      tester.widget(find.byKey(welcomeHeaderKey));

      await tester.tap(find.byKey(datePickerKey));
      await tester.tap(find.byKey(originalLocationKey));
      await tester.tap(find.byKey(destinationKey));
      await tester.tap(find.byKey(searchButtonKey));

      expect(find.byKey(datePickerKey), findsOneWidget);
      expect(find.byKey(originalLocationKey), findsOneWidget);
      expect(find.byKey(destinationKey), findsOneWidget);
      expect(find.byKey(searchButtonKey), findsOneWidget);
      expect(find.byKey(yaiKey),findsOneWidget);
      expect(find.byKey(welcomeHeaderKey),findsOneWidget);
     
      
     
  });
}