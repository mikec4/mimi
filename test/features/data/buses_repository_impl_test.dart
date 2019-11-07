
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/core/error/failures.dart';
import 'package:mimi/core/exceptions/exceptions.dart';
import 'package:mimi/core/network/network.dart';
import 'package:mimi/features/data/datasources/buses/buses_data_source.dart';
import 'package:mimi/features/data/models/busmodels/bus_models.dart';
import 'package:mimi/features/data/repositories/buses_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockRepo extends Mock implements BusesDataSource{}
class MockNetwork extends Mock implements Network{}

void main (){
  MockRepo mockRepo;
  MockNetwork mockNetwork;
  BusesRepositoryImp repository;

  setUp((){
    mockRepo = MockRepo();
    mockNetwork = MockNetwork();
    repository = BusesRepositoryImp(busesDataSource: mockRepo,network: mockNetwork);
  });

  group('Get all buses', (){
    final Map<String,dynamic> tRoutes = {};
    final tDate = DateTime.now();
    final tBusModels = BusModels();
    final tBuses = tBusModels;

    test('All buses online', () async{
      when(mockNetwork.isConnected).thenAnswer((_) async => true);
      when(mockRepo.getAllBuses(any, any)).thenAnswer((_) async => BusModels());

      var buses = await repository.getAllBuses(routes: tRoutes,departureDate: tDate);

      expect(buses, Right(tBuses));
      verify(mockRepo.getAllBuses(any, any));
      verify(mockNetwork.isConnected);
    });
    
     test('All buses offline', () async{
      when(mockNetwork.isConnected).thenAnswer((_) async => false);
      when(mockRepo.getAllBuses(any, any)).thenAnswer((_) async => BusModels());

      var buses = await repository.getAllBuses(routes: tRoutes,departureDate: tDate);

      verifyNever(mockRepo.getAllBuses(any, any));
      verify(mockNetwork.isConnected);
      verifyNoMoreInteractions(mockNetwork);
      expect(buses, null);

    });
    
     test('Failures', () async{
       when(mockRepo.getAllBuses(any, any)).thenThrow(ServerExceptions());

       var serverFailures = await repository.getAllBuses(routes:tRoutes,departureDate: tDate);

       expect(serverFailures, equals(Left(ServerFailures())));
     });
  });
}