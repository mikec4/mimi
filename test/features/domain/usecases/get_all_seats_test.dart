
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/core/error/failures.dart';
import 'package:mimi/core/params/bus_params.dart';
import 'package:mimi/features/domain/entities/seats/seats.dart';
import 'package:mimi/features/domain/repositories/seats_repository.dart';
import 'package:mimi/features/domain/usescases/get_all_seats.dart';
import 'package:mockito/mockito.dart';

class MockRepo extends Mock implements SeatsRepository{}

void main(){

  MockRepo mockRepo;
  GetAllSeats useCase;

  setUp((){
    mockRepo = MockRepo();
    useCase = GetAllSeats(seatsRepository: mockRepo);
  });

  group('Get All Seats', (){
    final tBusId = 'test';
    final tSeats = Seats();
    final tParams = BusParams(busId: tBusId);
    final tServerFailure = ServerFailures();

    test('Should get all bus seats', () async{

      when(mockRepo.getAllSeats(busId: tBusId)).thenAnswer((_) async => Right(tSeats));

      var seats = await useCase(params : tParams);

      expect(seats, equals(Right(tSeats)));
      verify(mockRepo.getAllSeats(busId: tBusId)).called(1);
      verifyNoMoreInteractions(mockRepo);
      
    });
    
    
    test('Should return seat failure',() async {

      when(mockRepo.getAllSeats(busId: tBusId)).thenAnswer((_) async => Left(tServerFailure));
      
      var failures = await useCase(params : tParams);

      expect(failures, Left(tServerFailure));
      verify(mockRepo.getAllSeats(busId: tBusId)).called(1);
      verifyNoMoreInteractions(mockRepo);

    });
  });

  
}