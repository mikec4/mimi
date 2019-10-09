import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/board_drop_location/repository/location_repository.dart';
import 'package:mimi/locator.dart';
import 'package:mimi/utils/base_model.dart';
import './bloc.dart';

class BoardingpointsBloc extends Bloc<BoardingpointsEvent, BoardingpointsState> {
  final _repository = locator<LocationsRepository>();

  @override
  BoardingpointsState get initialState => LoadingBoardingpointsState();

  @override
  Stream<BoardingpointsState> mapEventToState(
    BoardingpointsEvent event,
  ) async* {
    if(event is FetchAllBoardingPointsEvent){
      yield LoadingBoardingpointsState();

      try {
        var snapshot = await _repository.getBoardingPoints(event.busId);
        var boardingPoinits = BaseModel.fromSnapshot(snapshot, 'BoardingPoints');
        yield FetchAllBoardingPointsState(boardingPoints: boardingPoinits.items);

      } catch (e) {
        yield e is ErrorBoardingPointsState ? ErrorBoardingPointsState(error: e.error) : ErrorBoardingPointsState(error: 'Not backend error');
      }
    }
  }
}
