import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier{

  String _mobileNumber = '';
  
  String get mobileNumber => _mobileNumber;

  set setMobileNumber(String m){
    _mobileNumber = m;
    notifyListeners();
  }
  

}

