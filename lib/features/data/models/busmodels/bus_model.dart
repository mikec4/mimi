import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:mimi/features/domain/entities/buses/bus.dart';

class BusModel extends Bus{

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

  BusModel({
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
    }) : 
    super(
      id: id,
      name: name,
      fare: fare,
      registrationNumber : registrationNumber,
      busType : busType,
      departureTime : departureTime,
      arriveTime : arriveTime,
      reportTime : reportTime,
      route : route,
      arrivalDate : arrivalDate,
      departureDate : departureDate
      );

  factory BusModel.fromSnapshot(DocumentSnapshot snapshot){
    return BusModel(
      name: snapshot.data['Name'],
      id: snapshot.documentID,
      fare: snapshot.data['Fare'],
      registrationNumber: snapshot.data['RegistrationNumber'],
      busType: snapshot.data['BusType'],
      route: snapshot.data['Route'],
      departureDate: snapshot.data['DepartureDate'],
      arrivalDate: snapshot.data['ArrivalDate'],
      reportTime: snapshot.data['Time']['ReportTime'],
      departureTime: snapshot.data['Time']['DepartureTime'],
      arriveTime: snapshot.data['Time']['ArrivalTime'],
    );
  }
}