import 'package:flutter/foundation.dart';

class HomeProvider with ChangeNotifier{

  String _fromLocation ;
  String _destination ;
  DateTime _dateTime; 

  String get originalLocation => _fromLocation;
  String get destination => _destination;
  DateTime get date => _dateTime;

  void setOriginalLocation(String s){
    _fromLocation = s;
    notifyListeners();
  }

  void setDestination(String d){
    _destination = d;
    notifyListeners();
  }

  void setDate(DateTime dt){
    _dateTime = dt;
    notifyListeners();
  }
  
}