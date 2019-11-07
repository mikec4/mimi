
import 'dart:core';
import 'package:equatable/equatable.dart';

class Passenger extends Equatable{
  
  String _name;
  String _busId;
  String _fare;
  String _seatNumber;
  String _mobile;
  String _gender;
  String _boardLocation;
  String _dropLocation;
  bool _isInsured;
  Map<dynamic,dynamic> _route;
  String _departureTime;
  String _arrivalTime;
  DateTime _departureDate;
  DateTime _arrivalDate;

   
  Passenger({
    String name,
    String busId,
    String fare,
    String seatNumber,
    String mobile,
    String gender,
    String boardLocation,
    String dropLocation,
    bool isInsured,
    Map<dynamic,dynamic> route,
    String departureTime,
    String arrivalTime,
    DateTime departureDate,
    DateTime arrivalDate
    }) : 
    _name = name,
    _busId = busId,
    _fare = fare,
    _seatNumber = seatNumber,
    _mobile = mobile,
    _gender = gender,
    _boardLocation = boardLocation,
    _dropLocation = dropLocation,
    _isInsured = isInsured,
    _route = route,
    _departureTime = departureTime,
    _arrivalTime = arrivalTime,
    _departureDate = departureDate,
    _arrivalDate = arrivalDate ;

  
  @override
  List<Object> get props =>[
      name,
      busId,
      fare,
      mobile,
      gender,
      boardLocation,
      dropLocation,
      isInsured,
      route,
      departureTime,
      arrivalTime,
      departureDate,
      arrivalDate
      ]; 

  
  bool get isInsured => _isInsured;
  String get name => _name;
  String get busId => _busId;
  String get fare => _fare;
  String get seatNumber => _seatNumber;
  String get mobile => _mobile;
  String get gender => _gender;
  String get boardLocation => _boardLocation;
  String get dropLocation => _dropLocation;
  Map<dynamic,dynamic>  get route => _route;
  DateTime get departureDate => _departureDate;
  DateTime get arrivalDate => _arrivalDate;
  String get departureTime => _departureTime;
  String get arrivalTime => _arrivalTime;
  

  
  set setName(String n) => _name = n;
  set setBusId(String n) => _busId = n;
  set setFare(String n) => _fare = n;
  set setSeatNumber(String n) => _seatNumber = n;
  set setMobile(String n) => _mobile = n;
  set setGender(String n) => _gender = n;
  set setBoardLocation(String n) => _boardLocation = n;
  set setDropLocation(String n) => _dropLocation = n;
  set setRoute(Map<dynamic,dynamic>  n) => _route = n;
  set setDepartureDate(DateTime n) => _departureDate = n;
  set setArrivalDate(DateTime n) => _arrivalDate = n; 
  set setDepartureTime(String n) => _departureTime = n;
  set setArrivalTime(String n) => _arrivalTime = n;
  set setInsurance(bool i) => _isInsured = i;
  
  
  

}