import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/login/loginRepository/user_repository_impl.dart';
import 'package:mimi/login/model/user_model.dart';
import './bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepositoryImpl _userRepository;

  AuthenticationBloc({UserRepositoryImpl userRepository}) : 
  _userRepository = userRepository ?? UserRepositoryImpl();

  @override
  AuthenticationState get initialState => InitialAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {

    if (event is AppStarted) {
      yield* _mapAppStartedToState();

    }  else if (event is LoggedOut) {

      yield* _mapLoggedOutToState();
      
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {

    final result = await _userRepository.isLoggedIn();

    yield* result.fold(

      (failure) async*{
        yield ErrorAuthenticated(error: failure.failure);   
      }, 

      (isLoggedIn) async*{
        
       if(isLoggedIn){
         var user = await _userRepository.currentUser();
         yield* _mapLoggedInWithEmailToState(user);

        } else {
         yield Unauthenticated();
       } 
      });

  // try {

  //   final isSignedIn = await _userRepository.isSignedIn();

  //   if (isSignedIn) {

  //     final email = await _userRepository.getUserEmail();

  //     if(email.length != null){
  //       yield AuthenticatedWithEmail(email: email);
  //     }
      

  //   } else {

  //     yield Unauthenticated();
  //   }
  // } catch (_) {

  //   yield Unauthenticated();
  // }
}

Stream<AuthenticationState> _mapLoggedInWithEmailToState(Either<Failure,UserModel> user) async* {

  yield* user.fold(
    (failure) async*{

      yield ErrorAuthenticated(error: failure.failure);
    }, 
    (currentUser)async*{

      yield AuthenticatedWithEmail(user: currentUser);

    });

}


Stream<AuthenticationState> _mapLoggedOutToState() async* {
  yield Unauthenticated();
  _userRepository.signOut();
}

}
