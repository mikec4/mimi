import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Bus extends Equatable{
  final String id;
  final String name;
  final String fare;
  final String registrationNumber;
  final String busType;
  final String departureTime;
  final String arriveTime;
  final String reportTime;
  final Map<dynamic,dynamic> route;
  final Timestamp arrivalDate;
  final Timestamp departureDate;

  Bus({
    @required this.id, 
    @required this.name, 
    @required this.fare, 
    @required this.registrationNumber, 
    @required this.busType, 
    @required this.departureTime, 
    @required this.arriveTime, 
    @required this.reportTime, 
    @required this.route, 
    @required this.arrivalDate, 
    @required this.departureDate
    });
    
    @override
    List<Object> get props => [
      id,
      name,
      fare,
      registrationNumber,
      busType,
      departureTime,
      arriveTime,
      reportTime,
      route,
      arrivalDate,
      departureDate
      ];

}