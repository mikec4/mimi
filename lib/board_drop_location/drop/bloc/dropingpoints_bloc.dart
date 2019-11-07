import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/board_drop_location/repository/location_repository_impl.dart';
import './bloc.dart';

class DropingpointsBloc extends Bloc<DropingpointsEvent, DropingpointsState> {
  
  final LocationRepositoryImpl _locationRepository;

  DropingpointsBloc({LocationRepositoryImpl locationRepository}) : 
   _locationRepository = locationRepository  ?? LocationRepositoryImpl();


  @override
  DropingpointsState get initialState => LoadingDropingpointsState();

  @override
  Stream<DropingpointsState> mapEventToState(
    DropingpointsEvent event,
  ) async* {
    if(event is FetchAllDropingPointsEvent){
      yield LoadingDropingpointsState();

      // try {
      //   var snapshot = await _locationRepository.getDropingPoints(event.busId);
      //   var items = BaseModel.fromSnapshot(snapshot, 'DropingPoints').items;
      //   yield FetchAllDropingPointsState(items: items);
      // } catch (e) {
      //   yield e is ErrorDropingPointsState ? ErrorDropingPointsState(error: e.error) : ErrorDropingPointsState(error: 'Not backend error');
      // }

      var result = await _locationRepository.getLocations(event.busId,'DropingPoints');

      yield* result.fold((failure) async*{

        yield ErrorDropingPointsState(error: failure.failure);

      }, (baseModel) async*{

        yield FetchAllDropingPointsState(items: baseModel.items);

        
      });
    }
  }
}
