import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/seat/model/seatList.dart';
import 'package:mimi/seat/repository/seat_repository.dart';

class SeatRepositoryImpl implements SeatRepository{

  @override
  Future getAllSeats(String id) async{

    QuerySnapshot querySnapshot = await Firestore.instance.collection('Passengers').where('BusId',isEqualTo: id).getDocuments();
    
    return querySnapshot.documents;
  }

  @override
  Future<Either<Failure, SeatList>> getSeats(String id) async {
    
    try {
      QuerySnapshot querySnapshot = await Firestore.instance.collection('Passengers').where('BusId',isEqualTo: id).getDocuments();
      var seatLists = SeatList.fromSnapshots(querySnapshot.documents);

      return Right(seatLists);

    } on PlatformException catch (e) {
      
      final failure = Failure(failure: e.message);

      return Left(failure);
    }
  }

  

}