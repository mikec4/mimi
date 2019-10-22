import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/amenities/repository/amenities_repository_impl.dart';
import 'package:mimi/locator.dart';
import 'package:mimi/utils/base_model.dart';
import './bloc.dart';

class AmenitiesBloc extends Bloc<AmenitiesEvent, AmenitiesState> {
  final _repository = locator<AmenitiesRepositoryImpl>();

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

      try {
        var snapshot = await _repository.getAmenities(busId);
        var model = BaseModel.fromSnapshot(snapshot,'Amenities');

        yield FetchAllAmenitiesState(items: model.items);
        
      } catch (e) {
        yield e is ErrorAmenitiesState ? ErrorAmenitiesState(error: e.error) : ErrorAmenitiesState(error: 'Not platform error');
      }

  }
}
