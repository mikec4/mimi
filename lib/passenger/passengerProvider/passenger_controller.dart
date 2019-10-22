import 'package:flutter/foundation.dart';
import 'package:mimi/passenger/model/passenger.dart';

class PassengerController with ChangeNotifier{

  List<Passenger> _passengers = [];

  List<Passenger> get passengers => _passengers;
  
  void resetPassengerList(){
    this._passengers = [];
    notifyListeners();
  }
  
  void addPassenger(Passenger passenger){
    _passengers.add(passenger);
    notifyListeners();
  }


  
}