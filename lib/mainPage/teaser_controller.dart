import 'package:flutter/foundation.dart';

class TeaserController with ChangeNotifier{

  String _name;

  String get name => this._name;
  set setName(String n){
    _name = n;
    notifyListeners();
  }
}