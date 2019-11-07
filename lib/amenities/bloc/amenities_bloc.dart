import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/amenities/repository/amenities_repository_impl.dart';
import './bloc.dart';

class AmenitiesBloc extends Bloc<AmenitiesEvent, AmenitiesState> {
  //final _repository = locator<AmenitiesRepositoryImpl>();
  final AmenitiesRepositoryImpl _amenitiesRepository;

  AmenitiesBloc({AmenitiesRepositoryImpl amenitiesRepository}) :
  _amenitiesRepository = amenitiesRepository ?? AmenitiesRepositoryImpl();

  @override
  AmenitiesState get initialState => LoadingAmenitiesState();

  @override
  Stream<AmenitiesState> mapEventToState(
    AmenitiesEvent event,
  ) async* {
    if(event is FetchAllAmenitiesEvent){
      yield* _mapAmenitiesState(event.busId);
    }
  }

  Stream<AmenitiesState> _mapAmenitiesState(String busId) async*{

      yield LoadingAmenitiesState();

      // try {
      //   var snapshot = await _amenitiesRepository.getAmenities(busId);

      //   var model = BaseModel.fromSnapshot(snapshot,'Amenities');

      //   yield FetchAllAmenitiesState(items: model.items);
        
      // } catch (e) {
      //   yield e is ErrorAmenitiesState ? ErrorAmenitiesState(error: e.error) : ErrorAmenitiesState(error: 'Not platform error');
      // }

      var result = await _amenitiesRepository.getAllAmenites(busId, 'Amenities');

      yield* result.fold(
        (failure) async* {
          yield ErrorAmenitiesState(error: failure.failure);
        }, (baseModel) async* {
          yield FetchAllAmenitiesState(items: baseModel.items);
        });

  }
}
