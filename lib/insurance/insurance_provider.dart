
import 'package:flutter/foundation.dart';

class InsuranceProvider extends ChangeNotifier{

  String _radioValue='Yes';

  double _fare = 0.0;
  double _insurance = 5000.0;

  List<Map<String,dynamic>> _currentSeats = [];
  List<Map<String,dynamic>> get currentSeats => _currentSeats;

  set setCurrentSeats(List<Map<String,dynamic>> seat){
    _currentSeats = seat;
    notifyListeners();
  }
  String get radioValue => _radioValue;

  set setRadioValue(String v){
    _radioValue = v;
    notifyListeners();
  }

  double get fare => _fare;

  void addFareInsurance(double amount){
    _fare = amount + (_insurance * _currentSeats.length);

    notifyListeners();
  }
  
  void removeFareInsurance(double amount){
    _fare = amount;
    notifyListeners();
  }
}