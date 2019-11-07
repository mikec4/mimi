
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/login/bloc/bloc.dart';
import 'package:mimi/login/bloc/login_bloc.dart';
import 'package:mimi/login/loginRepository/user_repository_impl.dart';
import 'package:mimi/login/model/user_model.dart';
import 'package:mockito/mockito.dart';

class LoginMock extends Mock implements UserRepositoryImpl{}

void main(){

  LoginMock loginMock;
  LoginBloc loginBloc;

  setUp((){
    loginMock = LoginMock();
    loginBloc = LoginBloc(userRepository: loginMock);
  });

  tearDown((){
    loginBloc?.close();
  });

  group('Login bloc', (){

    test('Emits [InitialLoginState]', () {
      expect(loginBloc.initialState, InitialLoginState());
    });

    test('Emits nothing when state close',(){
      expectLater(loginBloc,emitsInOrder([InitialLoginState(),emitsDone]));
      loginBloc.close();
    });

    test('Login with google emits [InitialLoginState,LoadingLoginState,GoogleLoginState]', () {

      final response = [InitialLoginState(),LoadingLoginState(),GoogleLoginState(googleUser: UserModel())];
      when(loginMock.loginInWithGoogle()).thenAnswer((_) async => Right(UserModel()));

      expectLater(loginBloc, emitsInOrder(response));

      loginBloc.add(GoogleLoginEvent());
    });

    test('Login with google error emits [InitialLoginState,LoadingLoginState,ErrorLoginState]', () {
      final response = [InitialLoginState(),LoadingLoginState(),ErrorLoginState(message: Failure().failure)];
      when(loginMock.loginInWithGoogle()).thenAnswer((_) async => Left(Failure()));

      expectLater(loginBloc, emitsInOrder(response));

      loginBloc.add(GoogleLoginEvent());

    });

    test('Login with facebook emits [InitialLoginState,LoadingLoginState,FacebookLoginState]', () {

      final response = [InitialLoginState(),LoadingLoginState(),FacebookLoginState(facebookUser: UserModel())];
      when(loginMock.loginInWithFacebook()).thenAnswer((_) async => Right(UserModel()));

      expectLater(loginBloc, emitsInOrder(response));

      loginBloc.add(FacebookLoginEvent());
      
    });


     test('Login with facebook error emits [InitialLoginState,LoadingLoginState,ErrorLoginState]', () {
      final response = [InitialLoginState(),LoadingLoginState(),ErrorLoginState(message: Failure().failure)];
      when(loginMock.loginInWithFacebook()).thenAnswer((_) async => Left(Failure()));

      expectLater(loginBloc, emitsInOrder(response));

      loginBloc.add(FacebookLoginEvent());
      
    });
  });
}