import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:mimi/core/error/failures.dart';
import 'package:mimi/core/network/network.dart';
import 'package:mimi/features/data/datasources/buses/buses_data_source.dart';
import 'package:mimi/features/domain/entities/buses/buses..dart';
import 'package:mimi/features/domain/repositories/buses_repository.dart';

class BusesRepositoryImp implements BusesRepository{

  final BusesDataSource busesDataSource;
  final Network network;

  BusesRepositoryImp({this.busesDataSource,this.network});

  @override
  Future<Either<Failures, Buses>> getAllBuses({Map<String, dynamic> routes, DateTime departureDate}) async{
    if(await network.isConnected){

      try {
       var busesModels = await busesDataSource.getAllBuses(routes, departureDate);

       return Right(busesModels);

      } catch (e) {

        return Left(ServerFailures());

      }

    }else {
      return null;
    }
  }

}