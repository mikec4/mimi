import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mimi/login/model/user_model.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const <dynamic>[]]) : super(props);
}

class InitialAuthenticationState extends AuthenticationState {}


class AuthenticatedWithEmail extends AuthenticationState{

  //final String email;
  final UserModel user;
  AuthenticatedWithEmail ({this.user}) : super([user]);

  String toString() => 'Authenticated { email: ${user.email} }';

}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';
}


class AuthenticatedWithMobileNumber extends AuthenticationState {

  final String phoneNumber;

  AuthenticatedWithMobileNumber({this.phoneNumber}) : super([phoneNumber]);

  @override
  String toString() => 'Authenticated { displayName: $phoneNumber }';
}

class ErrorAuthenticated extends AuthenticationState{
  
  final String error;
  ErrorAuthenticated({this.error}) : super([error]);


}