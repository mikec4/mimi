import 'package:dartz/dartz.dart';
import 'package:mimi/core/error/failures.dart';
import 'package:mimi/features/domain/entities/seats/seats.dart';

abstract class SeatsRepository {
  Future<Either<Failures,Seats>> getAllSeats({String busId});

}