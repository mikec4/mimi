import 'package:flutter/foundation.dart';

class DropProvider extends ChangeNotifier{

  String _groupValue = '';

  String get groupValue => _groupValue;
  set setGroupValue(String value){
    _groupValue = value;
    notifyListeners();
  }

//  String _busId = '';
//  String get busId => _busId;
//  set setBusId(String id){
//    _busId = id;
//    notifyListeners();
//  }
//
//  Map<String,dynamic> _groupValue = {};
//  Map<String,dynamic> get groupValue => _groupValue;
//
//
//
//  void setGroupValue(){
//
//    if(busId.isNotEmpty){
//
//      if(groups.length >= 1){
//
//        groups.forEach((value){
//
//          if(value.containsValue(busId)){
//            _groupValue = value;
//            notifyListeners();
//            print('GROUP VALUE INSIDE $_groupValue');
//          }
//          if(!value.containsValue(busId)){
//            print('BOARD LOCATION NOT FOUND');
//          }
//        });
//
//      }
//    }
//  }
//
//  List<Map<String,dynamic>> _groups = [];
//  List<Map<String,dynamic>> get groups => _groups;
//  void addGroupValues(Map<String,dynamic> value){
//    if(!value.containsValue(busId)){
//      _groups.add(value);
//      notifyListeners();
//    }else{
//      _groups.removeWhere((value)=> value.containsValue(busId));
//      _groups.add(value);
//      notifyListeners();
//    }
//  }
//
////String get value => _value;
//
////  set setValue(String r){
////    _value = r;
////    notifyListeners();
////  }
//

}