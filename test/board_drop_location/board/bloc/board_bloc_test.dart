import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/board_drop_location/board/bloc/bloc.dart';
import 'package:mimi/board_drop_location/repository/location_repository_impl.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/utils/base_model.dart';
import 'package:mockito/mockito.dart';


class BoardingpointsMock extends Mock implements LocationRepositoryImpl{}


void main(){
  
  BoardingpointsMock boardingpointsMock;
  BoardingpointsBloc boardingpointsBloc;

  setUp(() async{

    boardingpointsMock = BoardingpointsMock();
    boardingpointsBloc = BoardingpointsBloc(locationRepository: boardingpointsMock);

  });

  tearDown((){
    boardingpointsBloc?.close();
  });

  group('Boarding points', (){

    final id = 'test';
    final failure = Failure(failure: 'Error');
    final model = BaseModel();
    
    
    test('Emits [LoadingBoardingpointsState]', () {
      expect(boardingpointsBloc.initialState, LoadingBoardingpointsState());
    });

    test('Does not emit any state when close', () {
      expectLater(boardingpointsBloc,emitsInOrder([LoadingBoardingpointsState(),emitsDone]));
      boardingpointsBloc.close();
    });

    test('Emits [LoadingBoardingPointsState,FetchAllBoardingPointsState]', () {

      final expected = [LoadingBoardingpointsState(),FetchAllBoardingPointsState(boardingPoints: model.items)];

      when(boardingpointsMock.getLocations(any,any)).thenAnswer((_) async => Right(model));

      
      expectLater(boardingpointsBloc, emitsInOrder(expected));

      boardingpointsBloc.add(FetchAllBoardingPointsEvent(busId:id));
       
    });


    test('Emits [LoadingBoardingpointsState,ErrorBoardingPointsState]', () {

      final response = [LoadingBoardingpointsState(),ErrorBoardingPointsState(error: failure.failure)];

      when(boardingpointsMock.getLocations(any,any)).thenAnswer((_) async => Left(failure));

      expectLater(boardingpointsBloc, emitsInOrder(response));

      boardingpointsBloc.add(FetchAllBoardingPointsEvent(busId: id));

    });


  });

}

