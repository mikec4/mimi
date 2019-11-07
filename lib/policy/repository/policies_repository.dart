
import 'package:dartz/dartz.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/utils/base_model.dart';

abstract class PoliciesRepository{
  Future<dynamic> getPolicies(String busId);
  Future<Either<Failure,BaseModel>> getAllPolicies(String busId, String type);
}