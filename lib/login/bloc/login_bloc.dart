import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/login/loginRepository/user_repository_impl.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  final UserRepositoryImpl _userRepository;

  LoginBloc({UserRepositoryImpl userRepository}): 
  _userRepository = userRepository ?? UserRepositoryImpl();

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
     LoginEvent event,
  ) async* {

    yield LoadingLoginState();

    if(event is GoogleLoginEvent){
      yield* _loginInWithGoogle();

    }

    else if(event is FacebookLoginEvent){
      yield* _loginWithFacebook();
    }

    
  }



  Stream<LoginState> _loginInWithGoogle() async*{

    
    // try {
    //   final result = await _userRepository.signInWithGoogle();

    //   final user = {
    //     "id" : result.uid,
    //     'email' : result.email,
    //     'phoneNumber' : result.phoneNumber
    //   };

    //   yield GoogleLoginState(googleUser: user);

    // } catch (e) {
    //   yield e is ErrorLoginState? ErrorLoginState(message: e.message) : ErrorLoginState(message: 'No platform exception');
    // }

    final result = await _userRepository.loginInWithGoogle();

    yield* result.fold(
      (failure) async*{
        yield ErrorLoginState(message: failure.failure);
      }, 
      (userModel)async*{
        yield GoogleLoginState(googleUser: userModel);
      }
     );

  }

  Stream<LoginState> _loginWithFacebook()async*{


    // try {
    //   final result =  await _userRepository.facebookSignIn();
    //   final user = {
    //     'id' : result.uid,
    //     'emal': result.email,
    //     'phoneNumber': result.phoneNumber
    //   };
      

    //   yield FacebookLoginState(facebookUser: user);
      
    // } catch (e) {
    //   yield e is ErrorLoginState? ErrorLoginState(message: e.message) : ErrorLoginState(message: 'No platform exception');
    // }

    final result = await _userRepository.loginInWithFacebook();
    yield* result.fold(
      (failure)async*{
        yield ErrorLoginState(message: failure.failure);
      }, 
      (userModel) async*{
        yield FacebookLoginState(facebookUser: userModel);
      }
      );
  }


 
}




