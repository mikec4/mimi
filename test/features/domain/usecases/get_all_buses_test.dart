
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/core/params/bus_params.dart';
import 'package:mimi/features/domain/entities/buses/buses..dart';
import 'package:mimi/features/domain/repositories/buses_repository.dart';
import 'package:mimi/features/domain/usescases/get_all_buses.dart';
import 'package:mockito/mockito.dart';

class MockRepo extends Mock implements BusesRepository{}


void main (){
 MockRepo mockRepo;
 GetAllBuses useCase;

 setUp((){
   mockRepo = MockRepo();
   useCase = GetAllBuses(busRepository: mockRepo);
 });
 
 group('Get All Buses', (){
   final tBuses = Buses();
   final Map<String,dynamic> tRoute = {};
   final tDate = DateTime.now();
   final tParams = BusParams(route: {},departureDate: DateTime.now());

   test('Should get a list of buses', () async{

     when(mockRepo.getAllBuses(routes: tRoute,departureDate: tDate)).thenAnswer((_) async => Right(tBuses));
     
     var buses = await useCase(params: tParams);

     expect(buses, equals(Right(tBuses)));
     verify(mockRepo.getAllBuses(routes: tRoute,departureDate: tDate));
     verifyNoMoreInteractions(mockRepo);
   });
 });
  
}