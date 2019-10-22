import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/utils/base_model.dart';

abstract class LocationsRepository{

  Future<dynamic> getBoardingPoints(String busId);
  Future<dynamic> getDropingPoints(String busId);
  Future<Either<Failure,BaseModel>> getBoardLocations(String busId);

}