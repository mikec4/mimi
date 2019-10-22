

import 'package:flutter/foundation.dart';

class BoardProvider extends ChangeNotifier{

  String _groupValue = '';

  String get groupValue => _groupValue;
  set setGroupValue(String value){
    _groupValue = value;
    notifyListeners();
  }
}