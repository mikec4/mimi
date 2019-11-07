

import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/bus/busProvider/bus_controller.dart';

void main() {
  BusController busController;

  setUp((){
    busController = BusController();
  });

  group('Bus controller', (){
    
    group('Bus Id', (){

      test('Should make Busid to empty', () {
      expect(busController.busId, equals(''));
      });

      test('Should make Busid test', () {
      busController.setBusId = 'test';
      expect(busController.busId, equals('test'));
      
      });

    });


    group('Bus seats', (){
      test('Should make a List of seats is empty', () {
      expect(busController.seats, equals([]));
     });

      test('Should make Bus seats to contain a test', () {
       busController.addSeats = 'test';
       expect(busController.seats, equals(['test']));
     });

    test('Should make Bus seats length to 1', () {
      busController.addSeats = 'test';
      expect(busController.seats.length, equals(1));
    });

    });
    

    group('Bus fare', (){

      test('Should make bus fare to 0.0,', () {
      expect(busController.fare, equals(0.0));
     });
      
      test('Bus fare is 10000.0', () {
        busController.setFare = 10000.0;
        expect(busController.fare, equals(10000.0));
      });

    });
    
    group('Insurance', (){

      test('Should make Insurance cost to 5000.0', () {
      expect(busController.insurance, equals(5000.0));
     });

      test('Should make isInsured to false', () {
      expect(busController.insured, equals(false));
     });

      test('should add insurance', () {
        busController.addInsurance();
        expect(busController.fare, equals(5000.0));
      });

      test('Should make isInsured to true', () {
        busController.addInsurance();
        expect(busController.insured,equals(true));
      });
    });
    
    
  });
}