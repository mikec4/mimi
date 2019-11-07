import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/board_drop_location/repository/location_repository_impl.dart';
import './bloc.dart';

class BoardingpointsBloc extends Bloc<BoardingpointsEvent, BoardingpointsState> {
  
  final LocationRepositoryImpl _locationRepository;

  BoardingpointsBloc({LocationRepositoryImpl locationRepository}) : 
  _locationRepository = locationRepository ?? LocationRepositoryImpl();

  @override
  BoardingpointsState get initialState => LoadingBoardingpointsState();

  @override
  Stream<BoardingpointsState> mapEventToState(
    BoardingpointsEvent event,
  ) async* {
    if(event is FetchAllBoardingPointsEvent){
      yield LoadingBoardingpointsState();

      // try {
      //   var snapshot = await _repository.getBoardingPoints(event.busId);
      //   var boardingPoinits = BaseModel.fromSnapshot(snapshot, 'BoardingPoints');
      //   yield FetchAllBoardingPointsState(boardingPoints: boardingPoinits.items);

      // } catch (e) {
      //   yield e is ErrorBoardingPointsState ? ErrorBoardingPointsState(error: e.error) : ErrorBoardingPointsState(error: 'Not backend error');
      // }

      var result = await _locationRepository.getLocations(event.busId,'BoardingPoints');

      yield* result.fold((failure) async*{

        yield ErrorBoardingPointsState(error: failure.failure);

      }, (baseModel) async*{

        yield FetchAllBoardingPointsState(boardingPoints: baseModel.items);
        
      });
    }
  }

  
}
