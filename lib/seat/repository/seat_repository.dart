
import 'package:dartz/dartz.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/seat/model/seatList.dart';

abstract class SeatRepository {

  Future<dynamic> getAllSeats(String id);
  Future<Either<Failure,SeatList>> getSeats(String id);
}


