import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:mimi/board_drop_location/repository/location_repository.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/utils/base_model.dart';

class LocationRepositoryImpl implements LocationsRepository{
  
  final Firestore _firestore;

  LocationRepositoryImpl({Firestore firestore}) :
   _firestore = firestore ?? Firestore.instance;

  // @override
  // Future getBoardingPoints(String busId) async{
  //   var _reference =await _firestore.collection('BoardingPoints').document(busId).get();

  //   return _reference;
  // }
  
  // @override
  // Future getDropingPoints(String busId) async{
  //   var _reference =await _firestore.collection('DropingPoints').document(busId).get();
  //   return _reference;
  // }

  @override
  Future<Either<Failure, BaseModel>> getLocations(String busId,String locationType) async{
    
    try {
      var _reference = await _firestore.collection(locationType).document(busId).get();
      var baseModel = BaseModel.fromSnapshot(_reference, locationType);

      return Right(baseModel);

    } on PlatformException catch (e) {

      var failure = Failure(failure: e.message);

      return Left(failure);
    }

  }

  
}

//BoardingPoints


  //  Future<DocumentSnapshot> getBoardingPoints(String busId) async{
  //   var _reference =await Firestore.instance.collection('BoardingPoints').document(busId).get();

  //   return _reference;
  // }
  
  //  Future<DocumentSnapshot> getDropingPoints(String busId) async{
  //   var _reference =await Firestore.instance.collection('DropingPoints').document(busId).get();
  //   return _reference;
  // }