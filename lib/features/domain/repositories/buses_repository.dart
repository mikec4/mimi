import 'package:dartz/dartz.dart';
import 'package:mimi/core/error/failures.dart';
import 'package:mimi/features/domain/entities/buses/buses..dart';

abstract class BusesRepository{

  Future<Either<Failures,Buses>> getAllBuses({Map<String,dynamic> routes,DateTime departureDate});

}