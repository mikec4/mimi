
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/authenticate/bloc/bloc.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/login/loginRepository/user_repository_impl.dart';
import 'package:mimi/login/model/user_model.dart';
import 'package:mockito/mockito.dart';

class AuthenticationMock extends Mock implements UserRepositoryImpl{}

void main(){
  AuthenticationMock authenticationMock;
  AuthenticationBloc authenticationBloc;

  setUp((){
    authenticationMock = AuthenticationMock();
    authenticationBloc = AuthenticationBloc(userRepository: authenticationMock);
  });

  tearDown((){
    authenticationBloc?.close();
  });



    group('Authentication bloc', (){

      test('Emits AppStarted', () {
      expect(authenticationBloc.initialState,InitialAuthenticationState());
    });

    test('Emits nothing after bloc close',(){
      expectLater(authenticationBloc, emitsInOrder([InitialAuthenticationState(),emitsDone]));
      authenticationBloc.close();
    });
      test('Emits as Logged in successfull', () {
        when(authenticationMock.isLoggedIn()).thenAnswer((_) async => Right(true));
        when(authenticationMock.currentUser()).thenAnswer((_) async => Right(UserModel()));

        final response = [InitialAuthenticationState(),AuthenticatedWithEmail(user: UserModel())];

        expectLater(authenticationBloc, emitsInOrder(response));

        authenticationBloc.add(AppStarted());

      });

      test('Emits [InitialAuthenticationState,Unauthenticated] failed logged in', () {
        when(authenticationMock.isLoggedIn()).thenAnswer((_) async => Right(false));
        final response = [InitialAuthenticationState(),Unauthenticated()];
        expectLater(authenticationBloc, emitsInOrder(response));

        authenticationBloc.add(AppStarted());

      });

      test('Emits [InitialAuthenticationState,ErrorAuthenticated] when logged in', () {
        when(authenticationMock.isLoggedIn()).thenAnswer((_) async => Left(Failure()));
        final response = [InitialAuthenticationState(),ErrorAuthenticated(error: Failure().failure)];

        expectLater(authenticationBloc, emitsInOrder(response));

        authenticationBloc.add(AppStarted());
      });

      test('AuthenticationWithEmail Error and Emits [InitialAuthenticationState,ErrorAuthenticated] ', () {
        when(authenticationMock.isLoggedIn()).thenAnswer((_) async => Right(true));
        when(authenticationMock.currentUser()).thenAnswer((_) async => Left(Failure()));

        final response = [InitialAuthenticationState(),ErrorAuthenticated(error: Failure().failure)];

        expectLater(authenticationBloc, emitsInOrder(response));

        authenticationBloc.add(AppStarted());
      });
    });

}