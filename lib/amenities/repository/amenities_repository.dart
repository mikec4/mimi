
import 'package:dartz/dartz.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/utils/base_model.dart';

abstract class AmenitiesRepository{
  
  //Future<dynamic> getAllAmenities(String id);
  Future<dynamic> getAmenities(String busId);
  Future<Either<Failure,BaseModel>> getAllAmenites(String busId,String type);
  
}