import 'package:flutter/foundation.dart';

class PaymentMethodController with ChangeNotifier{
  String _groupValue = '';
  
  String get groupValue => this._groupValue;
  set setGroupValue(String value){
    _groupValue = value;
    notifyListeners();
  }

 
  bool _isChecked = false;

  bool get isChecked => this._isChecked;
  set setCheck(bool check){
    this._isChecked = check;
    notifyListeners();
  }


  List<Map<String,dynamic>> _payments = [
    {"Vodacom-Mpesa": false},
    {"TigoPesa": false},
    {"Airtel-Money": false},
    {"Halotel-Pesa": false},
    {"T-Pesa": false},
  ];

  List<Map<String,dynamic>> get payments => _payments;
  
  // String _mpesa = 'Vodacom-Mpesa';
  // String get mPesa => this._mpesa;

  // String _tigoPesa ='TigoPesa';
  // String get tigoPesa => this._tigoPesa;

  // String _airtelMoney = 'Airtel-Money';
  // String get airtelMoney => this._airtelMoney;

  // String _halotelPesa = 'Halotel-Pesa';
  // String get halotelPesa => this._halotelPesa;

  // String _tPesa = 'T-Pesa';
  // String get tPesa => this._tPesa;



}