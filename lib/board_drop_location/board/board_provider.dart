

import 'package:flutter/foundation.dart';

class BoardProvider extends ChangeNotifier{

  String _groupValue = '';

  String get groupValue => _groupValue;
  set setGroupValue(String value){
    _groupValue = value;
    notifyListeners();
  }

//  String _notFound = '';
//  String get notFound => _notFound;
//
//  String _busId = '';
//  String get busId => _busId;
//  set setBusId(String id){
//    _busId = id;
//    notifyListeners();
//  }

//  Map<String,dynamic> _groupValue = {};
//  Map<String,dynamic> get groupValue => _groupValue;



//  void setGroupValue(){
//
//    if(busId.isNotEmpty){
//
//      if(groups.length >= 1){
//
//        groups.forEach((value){
//
//          if(value.containsKey('busId') && value.containsValue(busId)){
//            _groupValue = value;
//            notifyListeners();
//
//            print('GROUP VALUE INSIDE $_groupValue');
//
//          }else{
//            _groupValue = {};
//          }
//
//        });
//
//      }
//    }
//  }

//  List<Map<String,dynamic>> _groups = [];
//  List<Map<String,dynamic>> get groups => _groups;
//  void addGroupValues(Map<String,dynamic> value){
//    if(!value.containsValue(busId) && !value.containsKey('busId')){
//      _groups.add(value);
//      notifyListeners();
//    }
//     if(value.containsValue(busId)){
//        _groups.removeWhere ((value)=> value.containsValue (busId));
//        _groups.add (value);
//        notifyListeners ();
//
//    }
//  }


  
}