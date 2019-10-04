import 'dart:async';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/locator.dart';
import 'package:mimi/login/loginEntity/user_entity.dart';
import 'package:mimi/login/loginRepository/user_repository.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  
  final _userRepository = UserRepository();

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
     LoginEvent event,
  ) async* {

    if(event is VerifyMobileNumberLoginEvent){
      yield* _verifyPhoneNumber(mobile: event.internatinalizeNumber(event.mobile));
    }

    
    else if(event is GoogleLoginEvent){
      yield* _loginInWithGoogle();

    }

    else if(event is FacebookLoginEvent){
      yield* _loginWithFacebook();
    }

    else if (event is LoginWithMobileNumberLoginEvent) {
      yield* _loginWithMobileNumber(verificationId: event.verificationId,smsCode: event.smsCode);
    }
  }

  Stream<LoginState> _verifyPhoneNumber({String mobile}) async*{
     
    yield LoadingLoginState();

    try {

      await _userRepository.verifyPhoneNumber(mobile);
      final mobileNumber = await _userRepository.getUserNumber();

      yield VerifyMobileNumberLoginState(user: mobileNumber);

    } catch (e) {

      yield e is ErrorLoginState ?? ErrorLoginState(message: e.message) ;
    }
  }

  Stream<LoginState> _loginInWithGoogle() async*{

    yield LoadingLoginState();
    
    try {
      final result = await _userRepository.signInWithGoogle();

      final user = {
        "id" : result.uid,
        'email' : result.email,
        'phoneNumber' : result.phoneNumber
      };

      yield GoogleLoginState(googleUser: user);

    } catch (e) {
      yield e is ErrorLoginState? ErrorLoginState(message: e.message) : ErrorLoginState(message: 'No platform exception');
    }

  }

  Stream<LoginState> _loginWithFacebook()async*{

    yield LoadingLoginState();

    try {
      final result =  await _userRepository.facebookSignIn();
      final user = {
        'id' : result.uid,
        'emal': result.email,
        'phoneNumber': result.phoneNumber
      };
      

      yield FacebookLoginState(facebookUser: user);
      
    } catch (e) {
      yield e is ErrorLoginState? ErrorLoginState(message: e.message) : ErrorLoginState(message: 'No platform exception');
    }
  }

  Stream<LoginState> _loginWithMobileNumber({String verificationId, String smsCode}) async*{
    yield LoadingLoginState();
    
    try {
      final user = await _userRepository.signInWithPhoneNumber(verificationId:verificationId,smsCode: smsCode);
      yield SuccessMobileNumberLoginState(success: user.phoneNumber);

    } catch (e) {
      yield e is ErrorLoginState? ErrorLoginState(message: e.message) : ErrorLoginState(message: 'No platform exception');
    }
  }

 
}




