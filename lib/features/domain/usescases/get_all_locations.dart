
import 'package:dartz/dartz.dart';
import 'package:mimi/core/error/failures.dart';
import 'package:mimi/core/params/locations_params.dart';
import 'package:mimi/core/usecases/use_cases.dart';
import 'package:mimi/features/domain/entities/locations/locations.dart';
import 'package:mimi/features/domain/repositories/locations_repository.dart';

class GetAllLocations extends UsesCases<Locations,LocationsParams> {

  final LocationsRepository locationsRepository;

  GetAllLocations({this.locationsRepository});

  @override
  Future<Either<Failures, Locations>> call({LocationsParams params}) async{
    return locationsRepository.getAllLocations(busId: params.busId,locationType: params.locationType);
  }


}

