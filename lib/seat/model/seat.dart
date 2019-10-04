
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Seat extends Equatable{

  String seatNumber;
  String gender;

  Seat({this.seatNumber,this.gender}) :super([seatNumber,gender]);

 
  factory Seat.fromSnapshot(DocumentSnapshot snapshot){
    return Seat(
      seatNumber: snapshot.data['SeatNumber'],
      gender: snapshot.data['Gender']
    );
  }
}




