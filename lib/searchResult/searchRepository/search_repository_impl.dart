import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/searchResult/searchModel/search_bus_list.dart';
import 'package:mimi/searchResult/searchRepository/search_repository.dart';

class SearchRepositoryImpl extends SearchRepository{

  Future fetchAll() async{

    QuerySnapshot querySnapshot =  await Firestore.instance.collection('Bus').getDocuments();
    return querySnapshot.documents;

  }

  Future getByQuery(Map<String,dynamic> route,DateTime dateTime) async{
    QuerySnapshot querySnapshot = await Firestore.instance.collection('Bus')
                                   .where('Route',isEqualTo: route)
                                   .where('DepartureDate',isEqualTo: dateTime)
                                   .getDocuments();
    
    return querySnapshot.documents;
  }

  @override
  Future<Either<Failure, SearchBusList>> queryAllBuses(Map<String, dynamic> route, DateTime dateTime) async{
    
    try {

      QuerySnapshot querySnapshot = await Firestore.instance.collection('Bus')
                                   .where('Route',isEqualTo: route)
                                   .where('DepartureDate',isEqualTo: dateTime)
                                   .getDocuments();
      var searches = SearchBusList.fromSnapshots(querySnapshot.documents);

      return Right(searches);

    } on PlatformException catch(e) {
      
      var failure = Failure(failure: e.message);

      return Left(failure);
    }

    
  }

  

  
}