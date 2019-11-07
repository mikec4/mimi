import 'package:dartz/dartz.dart';
import 'package:mimi/core/error/failures.dart';
import 'package:mimi/core/params/bus_params.dart';
import 'package:mimi/core/usecases/use_cases.dart';
import 'package:mimi/features/domain/entities/seats/seats.dart';
import 'package:mimi/features/domain/repositories/seats_repository.dart';

class GetAllSeats extends UsesCases<Seats,BusParams>{
  
  final SeatsRepository seatsRepository;

  GetAllSeats({this.seatsRepository}) : assert(seatsRepository != null);

  @override
  Future<Either<Failures, Seats>> call({BusParams params}) {
    return seatsRepository.getAllSeats(busId: params.busId);
  }

}