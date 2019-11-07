
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/home/homeProvider/home_provider.dart';

void main(){
  HomeProvider homeProvider;

  setUp((){
    homeProvider = HomeProvider();
  });
  
  group('Home provider', (){

    group('Original location', (){
      
      test('Original location is null', () {
        expect(homeProvider.originalLocation, equals(null));
      });

      test('Current destination location is test', () {
        homeProvider.setOriginalLocation('test');
        expect(homeProvider.originalLocation,equals('test'));
      });
      
    });

    group('Destination location', (){
      test('Initial destination location is null', () {
        expect(homeProvider.destination,equals(null));
      });

      test('Current destination location is test', () {
        homeProvider.setDestination('test');
        expect(homeProvider.destination,equals('test'));
      });
    });

    group('Departure date', (){
      test('Initial date is null', () {
        expect(homeProvider.date,equals(null));
      });
      // test('Current date is now', () {
      //   homeProvider.setDate(DateTime.now());
      //   expect(homeProvider.date,equals(DateTime.now()));
      // });
    });
  });
}