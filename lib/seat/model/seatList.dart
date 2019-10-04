import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mimi/seat/model/seat.dart';

class SeatList{
  
  List<Seat> seats;

  SeatList({this.seats});

  static SeatList fromSnapshots(List<DocumentSnapshot> snapshots){
    final results = snapshots.map((snapshot) => Seat.fromSnapshot(snapshot)).toList();
    return SeatList(
      seats: results
    );
  }
}