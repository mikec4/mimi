import 'package:flutter/foundation.dart';
import 'package:mimi/searchResult/searchModel/search_bus.dart';

class FilterController with ChangeNotifier{
  List<SearchBus> _buses = [];

  set setBuses(List<SearchBus> buses){
    _buses = buses;
    notifyListeners();
  }

  List<SearchBus> get buses => _buses;

 // TRAVEL NAMES
  List<String> _travelNames = [];

  void addTravelNames(String name){
    _travelNames.add(name);
    notifyListeners();
  }

  void removeTravelNames(String name){
    _travelNames.remove(name);
    notifyListeners();
  }

  List<String> get travelNames => _travelNames;
  

  // DEPARTURE TIMES

  List<String> _departureTimes = [];

  set setDepartureTimes(String time){
    _departureTimes.add(time);
    notifyListeners();
  }

  set removeDepartureTimes(String time){
    _departureTimes.remove(time);
    notifyListeners();
  }

  List<String> get departureTimes => _departureTimes;
  
  
}