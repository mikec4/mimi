
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/core/error/failures.dart';
import 'package:mimi/core/params/no_params.dart';
import 'package:mimi/features/domain/entities/user/user.dart';
import 'package:mimi/features/domain/repositories/user_repository.dart';
import 'package:mimi/features/domain/usescases/current_user.dart';
import 'package:mockito/mockito.dart';

class MockRepo extends Mock implements UserRepository{}

void main (){
  MockRepo mockRepo;
  CurrentUser useCase;

  setUp((){
    mockRepo = MockRepo();
    useCase = CurrentUser(userRepository: mockRepo);
  });

  group('Get current user', (){

    final tNoParams = NoParams();
    final tUser = User(uid: 'id',names: 'test',mobileNumber: '0',email: 'hell0');
    final tServerFailures = ServerFailures();

    test('Success', () async{

      when(mockRepo.currentUser()).thenAnswer((_) async => Right(tUser));
      
     var user = await useCase(params : tNoParams);

     expect(user,Right(tUser));
     verify(mockRepo.currentUser()).called(1);
     verifyNoMoreInteractions(mockRepo);
    });

    test('Failure', () async{
      
     when(mockRepo.currentUser()).thenAnswer((_) async => Left(tServerFailures));
      
     var failures = await useCase(params : tNoParams);

     expect(failures,Left(tServerFailures));
     verify(mockRepo.currentUser()).called(1);
     verifyNoMoreInteractions(mockRepo);

    });
  });
}