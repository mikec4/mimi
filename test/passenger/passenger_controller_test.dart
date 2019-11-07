import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/passenger/model/passenger.dart';
import 'package:mimi/passenger/passengerProvider/passenger_controller.dart';

void main(){

  PassengerController passengerController;

  setUp((){
    passengerController = PassengerController();
  });

  group('Passenger Controller', (){

    test('Initial passenger list is empty', () {
      expect(passengerController.passengers, equals([]));
    });

    test('Passenger list should contain [Passenger]', () {
      passengerController.addPassenger(Passenger());
      expect(passengerController.passengers, equals([Passenger()]));
    });

  });
}