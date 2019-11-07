import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mimi/features/data/models/seatmodels/seat_model.dart';

class SeatModels extends Equatable{
  
  final List<SeatModel> seatModels;

  SeatModels({this.seatModels});

  @override 
  List<Object> get props => [seatModels];

  factory SeatModels.fromDocumentSnapshots(List<DocumentSnapshot> snapshots){
    var seatModels = snapshots.map((documentSnapshot) => SeatModel.fromSnapshot(documentSnapshot)).toList();
    return SeatModels(
      seatModels:  seatModels
    );
  }
}