import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/board_drop_location/repository/location_repository.dart';
import 'package:mimi/utils/base_model.dart';
import '../../../locator.dart';
import './bloc.dart';

class DropingpointsBloc extends Bloc<DropingpointsEvent, DropingpointsState> {
  final _repository = locator<LocationsRepository>();
  @override
  DropingpointsState get initialState => LoadingDropingpointsState();

  @override
  Stream<DropingpointsState> mapEventToState(
    DropingpointsEvent event,
  ) async* {
    if(event is FetchAllDropingPointsEvent){
      yield LoadingDropingpointsState();

      try {
        var snapshot = await _repository.getDropingPoints(event.busId);
        var items = BaseModel.fromSnapshot(snapshot, 'DropingPoints').items;
        yield FetchAllDropingPointsState(items: items);
      } catch (e) {
        yield e is ErrorDropingPointsState ? ErrorDropingPointsState(error: e.error) : ErrorDropingPointsState(error: 'Not backend error');
      }
    }
  }
}
