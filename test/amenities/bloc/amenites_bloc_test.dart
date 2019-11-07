
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/amenities/bloc/amenities_bloc.dart';
import 'package:mimi/amenities/bloc/bloc.dart';
import 'package:mimi/amenities/repository/amenities_repository_impl.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/utils/base_model.dart';
import 'package:mockito/mockito.dart';

class AmenitiesMock extends Mock implements AmenitiesRepositoryImpl{}

void main(){
  AmenitiesMock amenitiesMock;
  AmenitiesBloc amenitiesBloc;
  

  setUp((){
    amenitiesMock = AmenitiesMock();
    amenitiesBloc = AmenitiesBloc(amenitiesRepository: amenitiesMock);
  });

  tearDown((){
    amenitiesBloc.close();
  });

  group('Amenities bloc', (){
    final baseModel = BaseModel();
    final id = 'busId';
    final failure = Failure();

    test('Emits [LoadingAmenitiesState]', () {
      expect(LoadingAmenitiesState(), amenitiesBloc.initialState);
    });

    test('Emits nothing after bloc close', () {
      expectLater(amenitiesBloc, emitsInOrder([LoadingAmenitiesState(),emitsDone]));
      amenitiesBloc.close();
    });

    test('Emits [LoadingAmenitiesState,FetchAllAmenitiesState]', () {

      final response = [LoadingAmenitiesState(),FetchAllAmenitiesState(items: baseModel.items)];

      when(amenitiesMock.getAllAmenites(any, any)).thenAnswer((_) async=> Right(baseModel));

      expectLater(amenitiesBloc, emitsInOrder(response));

      amenitiesBloc.add(FetchAllAmenitiesEvent(busId: id));

    });

    test('Emits [LoadingAmenitiesState,ErrorAmenitiesState]', () {

      final response = [LoadingAmenitiesState(),ErrorAmenitiesState(error: failure.failure)];

      when(amenitiesMock.getAllAmenites(any, any)).thenAnswer((_) async=> Left(Failure()));

      expectLater(amenitiesBloc, emitsInOrder(response));

      amenitiesBloc.add(FetchAllAmenitiesEvent(busId: id));
      
    });
  });
}