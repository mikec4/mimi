import 'package:flutter/foundation.dart';

class BusController with ChangeNotifier{
  
  //Add seats
  List<String> _seats = [];

  List<String> get seats => _seats;
  
  set addSeats(String seat){
     
     if(_seats.contains(seat)){
       _seats.remove(seat);
     }else {
      _seats.add(seat);
     }
    
    notifyListeners();

  }

  void resetSeats(){
    _seats = [];
    notifyListeners();
  }
  
  //set current bus fare
  double _fare = 0.0;
  
  double get fare => _fare;

  set setFare(double f){
    _fare = f;
    notifyListeners();
  }

  // add insurance per user

  double _insurance = 5000.0;
  double get insurance => _insurance;
  
  bool _isInsured = false;
  
  bool get insured => _isInsured;

  void addInsurance(){
    this._fare = this._fare + this._insurance;
    _isInsured = true;
    notifyListeners();
  }

  void removeInsurance(){
    this._fare = this._fare - this._insurance;
    _isInsured =false;
    notifyListeners();
  }

}

