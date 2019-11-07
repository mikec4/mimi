
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/policy/bloc/bloc.dart';
import 'package:mimi/policy/repository/policieis_repository_impl.dart';
import 'package:mimi/utils/base_model.dart';
import 'package:mockito/mockito.dart';

class PoliciesMock extends Mock implements PoliciesRepositoryImpl{}


void main(){
  PoliciesMock policiesMock;
  PoliciesBloc policiesBloc;

  setUp((){
    policiesMock = PoliciesMock();
    policiesBloc = PoliciesBloc(policiesRepository: policiesMock);
  });

  tearDown((){
    policiesBloc?.close();
  });

  group('Policies bloc', (){
    final baseModel = BaseModel();
    final id = 'busId';
    final failure = Failure();

    test('Emits [LoadingAmenitiesState]', () {
      expect(LoadingPoliciesState(), policiesBloc.initialState);
    });

    test('Emits nothing after bloc close', () {
      expectLater(policiesBloc, emitsInOrder([LoadingPoliciesState(),emitsDone]));
      policiesBloc.close();
    });

    test('Emits [LoadingPoliciesState,FetchAllPoliciesState]', () {

      final response = [LoadingPoliciesState(),FetchAllPoliciesState(polices: baseModel.items)];

      when(policiesMock.getAllPolicies(any, any)).thenAnswer((_) async=> Right(baseModel));

      expectLater(policiesBloc, emitsInOrder(response));

      policiesBloc.add(FetchAllPoliciesEvent(busId: id));

    });

    test('Emits [LoadingPoliciesState,ErrorPoliciesState]', () {

      final response = [LoadingPoliciesState(),ErrorPoliciesState(error: failure.failure)];

      when(policiesMock.getAllPolicies(any, any)).thenAnswer((_) async=> Left(Failure()));

      expectLater(policiesBloc, emitsInOrder(response));

      policiesBloc.add(FetchAllPoliciesEvent(busId: id));
      
    });
  });
}