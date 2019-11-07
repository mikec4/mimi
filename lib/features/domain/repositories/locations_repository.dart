import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mimi/core/error/failures.dart';
import 'package:mimi/features/domain/entities/locations/locations.dart';

abstract class LocationsRepository extends Equatable{

  LocationsRepository();

  Future<Either<Failures,Locations>> getAllLocations({String busId,String locationType});

}