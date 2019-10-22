

import 'package:dartz/dartz.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/searchResult/searchModel/search_bus_list.dart';

abstract class SearchRepository {
  
  Future<dynamic> fetchAll();
  Future<dynamic> getByQuery(Map<String,dynamic> route,DateTime dateTime);
  
  Future<Either<Failure,SearchBusList>> queryAllBuses(Map<String,dynamic> route,DateTime dateTime);

}