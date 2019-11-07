
import 'package:dartz/dartz.dart';
import 'package:mimi/core/error/failures.dart';
import 'package:mimi/core/params/bus_params.dart';
import 'package:mimi/core/usecases/use_cases.dart';
import 'package:mimi/features/domain/entities/buses/buses..dart';
import 'package:mimi/features/domain/repositories/buses_repository.dart';

class GetAllBuses implements UsesCases<Buses,BusParams>{

  final BusesRepository busRepository;

  GetAllBuses({this.busRepository}) : assert(busRepository != null);

  @override
  Future<Either<Failures, Buses>> call({BusParams params}) async{
    return busRepository.getAllBuses(routes: params.route,departureDate: params.departureDate);
  }
  

}




