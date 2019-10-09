import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class SearchBus extends Equatable {

  String id;
  String name;
  String fare;
  String registrationNumber;
  String busType;
  String departureTime;
  String arriveTime;
  String reportTime;
  Map<dynamic,dynamic> route;
 // Timestamp date;
  Timestamp arrivalDate;
  Timestamp departureDate;

  
  SearchBus({
    this.name,
    this.id,
    this.fare,
    this.route,
   // this.date,
    this.registrationNumber,
    this.busType,
    this.arriveTime,
    this.departureTime,
    this.reportTime,
    this.departureDate,
    this.arrivalDate
    }) : super([
      name,
      id,
      fare,
      busType,
      route,
      registrationNumber,
      arriveTime,
      departureTime,
      reportTime,
      departureDate,
      arrivalDate
      ]);

  static SearchBus fromJson(Map<String,dynamic> json){
    return SearchBus(
      name: json['Name'],
      id: json['ID'],
      fare: json['Fare'],
      route: json['Route'],
    );
  }

  static SearchBus fromSnapshot(DocumentSnapshot snapshot){
    return SearchBus(
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

  // static SearchBus fromSnapshot(DocumentSnapshot snapshot){
  //   return SearchBus(
  //     name: snapshot.data['Name'],
  //     id: snapshot.documentID,
  //     fare: snapshot.data['Fare'],
  //     route: snapshot.data['Route'],
  //     date: snapshot.data['Date'],
  //     reportTime: snapshot.data['Time'][0]['ReportTime'],
  //     departureTime: snapshot.data['Time'][1]['DepartureTime'],
  //     arriveTime: snapshot.data['Time'][2]['ArrivalTime'],
  //   );
  // }


}