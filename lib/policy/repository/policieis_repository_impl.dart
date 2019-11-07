import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/policy/repository/policies_repository.dart';
import 'package:mimi/utils/base_model.dart';

class PoliciesRepositoryImpl extends PoliciesRepository{
  
  @override
  Future getPolicies(String busId) async{
    var _reference =await Firestore.instance.collection('Policies').document(busId).get();
    return _reference;
  }

  @override
  Future<Either<Failure, BaseModel>> getAllPolicies(String busId, String type) async{
    try {
      var _reference =await Firestore.instance.collection(type).document(busId).get();
      var model = BaseModel.fromSnapshot(_reference, type);
      return Right(model);
    } on PlatformException catch (e) {
      var failure = Failure(failure: e.message);
      return Left(failure);
    }
  }
}