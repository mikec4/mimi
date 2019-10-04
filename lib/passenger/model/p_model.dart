import 'package:equatable/equatable.dart';

class PModel extends Equatable{
  String name;
  String busId;
  String fare;
  String seatNumber;
  String mobile;
  String gender;
  String boardLocation;
  String dropLocation;
  bool isInsured;
  Map<dynamic,dynamic> route;
  String departureTime;
  String arrivalTime;
  DateTime departureDate;
  DateTime arrivalDate;

  PModel({
    this.name,
    this.busId,
    this.fare,
    this.seatNumber,
    this.gender,
    this.mobile,
    this.boardLocation,
    this.dropLocation,
    this.isInsured,
    this.route,
    this.departureTime,
    this.arrivalTime,
    this.departureDate,
    this.arrivalDate
    }): 
    super([
      name, 
      fare,
      busId,
      gender,
      seatNumber,
      mobile,
      dropLocation,
      boardLocation,
      isInsured,
      route,
      departureTime,
      arrivalTime,
      departureDate,
      arrivalDate
      ]);

}