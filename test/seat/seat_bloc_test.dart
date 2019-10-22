
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/seat/bloc/bloc.dart';
import 'package:mimi/seat/bloc/seat_bloc.dart';
import 'package:mimi/seat/model/seatList.dart';
import 'package:mimi/seat/repository/seat_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockSeatRepository extends Mock implements SeatRepositoryImpl{}
class MockBloc extends Mock implements SeatBloc{}

void main(){

  MockSeatRepository mockSeatRepository;
  MockBloc mockBloc;
  SeatBloc seatBloc;

  setUp((){
    mockSeatRepository = MockSeatRepository();
    mockBloc = MockBloc();
    seatBloc = SeatBloc(seatRepositoryImpl: mockSeatRepository);

  });


  tearDown((){
    seatBloc?.close();

  });

  group('Seatblocs', (){

    final busId = 'test';
    final seatList = SeatList();    
    final failure = Failure(failure: 'Seat failure');

    test('Emits initialstate', () {
      expect(LoadSeatState(),seatBloc.initialState);
    });

    test('Does not emit new state when bloc closes', () {
      expectLater(seatBloc, emitsInOrder([LoadSeatState(),emitsDone]));
      seatBloc.close();
    });


    test('Emits [LoadSeatState,ListSeatState]', () {

      final response = [LoadSeatState(),ListSeatState(seats: seatList.seats)];
      
      when(mockSeatRepository.getSeats(any)).thenAnswer((_) async => Right(SeatList()));

      expectLater(seatBloc, emitsInOrder(response));

      seatBloc.add(FetchAllSeatEvent(busId: busId));

    });

    test('Emits [LoadSeatState,ErroSeatState]', () {
      
      final response = [LoadSeatState(),ErrorSeatState(message: failure.failure)];
      
      when(mockSeatRepository.getSeats(any)).thenAnswer((_) async => Left(failure));

      expectLater(seatBloc, emitsInOrder(response));

      seatBloc.add(FetchAllSeatEvent(busId: busId));
 
    });

  });
}

