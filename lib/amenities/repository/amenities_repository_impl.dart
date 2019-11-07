import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:mimi/amenities/repository/amenities_repository.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/utils/base_model.dart';

class AmenitiesRepositoryImpl implements AmenitiesRepository{
  
  // @override
  // Future getAllAmenities(String id) async{
  //   QuerySnapshot querySnapshot = await Firestore.instance.collection('Amenities').
  //    where('BusId',isEqualTo:id).getDocuments();
    
  //   return querySnapshot.documents;
  // }

  @override
  Future getAmenities(String busId) async {

    var _reference = await Firestore.instance.collection('Amenities').document(busId).get();
    
    return _reference;
  }

  @override
  Future<Either<Failure, BaseModel>> getAllAmenites(String busId, String type) async{  
    try {
      var _reference = await Firestore.instance.collection(type).document(busId).get();
      var model = BaseModel.fromSnapshot(_reference, type);

      return Right(model);
      
    } on PlatformException catch (e) {
      var failure = Failure(failure: e.message);

      return Left(failure);
    }
  }

}



  // Future<List<DocumentSnapshot>> getAllAmenities(String id) async {

  //   QuerySnapshot querySnapshot = await Firestore.instance.collection('Amenities').
  //    where('BusId',isEqualTo:id).getDocuments();
    
  //   return querySnapshot.documents;
  // }
  
  // Future<DocumentSnapshot> getAmenities(String busId) async{
  //   var _reference =await Firestore.instance.collection('Amenities').document(busId).get();
  //   return _reference;
  // }