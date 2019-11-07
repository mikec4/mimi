
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/board_drop_location/drop/bloc/bloc.dart';
import 'package:mimi/board_drop_location/drop/bloc/dropingpoints_bloc.dart';
import 'package:mimi/board_drop_location/repository/location_repository_impl.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/utils/base_model.dart';
import 'package:mockito/mockito.dart';

class DropingpointsMock extends Mock implements LocationRepositoryImpl{}

void main(){
  DropingpointsMock dropingpointsMock;
  DropingpointsBloc dropingpointsBloc;

  setUp((){
    dropingpointsMock = DropingpointsMock();
    dropingpointsBloc = DropingpointsBloc(locationRepository: dropingpointsMock);

  });

  tearDown((){
    dropingpointsBloc?.close();
  });

  group('Droping Points bloc', (){

    final id = 'test';
    final failure = Failure(failure: 'Error');
    final model = BaseModel();

    test('Emits [LoadingDropingpointsState]', (){
      expect(dropingpointsBloc.initialState, LoadingDropingpointsState());
    });

    test('Emits nothing after bloc close', (){
      expectLater(dropingpointsBloc, emitsInOrder([LoadingDropingpointsState(),emitsDone]));
      dropingpointsBloc.close();
    });
   
    test('Emits [LoadingDropingpointsState,FetchAllDropingPointsState]', () {

      final response = [LoadingDropingpointsState(),FetchAllDropingPointsState(items: model.items)];
      
      when(dropingpointsMock.getLocations(any, any)).thenAnswer((_) async => Right(model));

      expectLater(dropingpointsBloc, emitsInOrder(response));

      dropingpointsBloc.add(FetchAllDropingPointsEvent(busId: id));

    });

    test('Emits [LoadingDropingpointsState,ErrorDropingPointsState]', () {
      final response = [LoadingDropingpointsState(),ErrorDropingPointsState(error: failure.failure)];

      when(dropingpointsMock.getLocations(any, any)).thenAnswer((_) async => Left(failure));

      expectLater(dropingpointsBloc, emitsInOrder(response));

      dropingpointsBloc.add(FetchAllDropingPointsEvent(busId: id));

    });

  });
}