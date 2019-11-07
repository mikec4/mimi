import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mimi/features/domain/entities/seats/seat.dart';

class SeatModel extends Seat{
  final String seatNumber;
  final String gender;

  SeatModel({this.seatNumber, this.gender}) : super(seatNumber : seatNumber,gender: gender);

  factory SeatModel.fromSnapshot(DocumentSnapshot snapshot){
    return SeatModel(
      seatNumber: snapshot.data['SeatNumber'],
      gender: snapshot.data['Gender']
    );
  }
}