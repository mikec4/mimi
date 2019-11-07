import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mimi/login/model/user_model.dart';

@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const <dynamic>[]]) : super(props);
}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState{

  @override 
  String toString() => 'Loading Login State';
}



class GoogleLoginState extends LoginState{

  //final Map<String,dynamic> googleUser;
  final UserModel googleUser;
  GoogleLoginState({@required this.googleUser}): super([googleUser]);

  @override
  String toString() {
    return 'Success Login with google';
  }
}


class FacebookLoginState extends LoginState{
  //final Map<String, dynamic> facebookUser;
   final UserModel facebookUser;
  FacebookLoginState({this.facebookUser}) : super([facebookUser]);

  @override
  String toString() => 'FacebookLogin State';

}



class SuccessMobileNumberLoginState extends LoginState{

  final String success;

  SuccessMobileNumberLoginState({@required this.success}) : super([success]);

  @override
  String toString() {
    return 'Success login state';
  }
}



class VerifyMobileNumberLoginState extends LoginState{

  final String user;

  VerifyMobileNumberLoginState({@required this.user}): super([user]);
}



class ErrorLoginState extends LoginState{

  final String message;

  ErrorLoginState({@required this.message}) : super([message]);
}
