import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const <dynamic>[]]) : super(props);
}

class InitialAuthenticationState extends AuthenticationState {}


class AuthenticatedWithMobileNumber extends AuthenticationState {

  final String phoneNumber;

  AuthenticatedWithMobileNumber({this.phoneNumber}) : super([phoneNumber]);

  @override
  String toString() => 'Authenticated { displayName: $phoneNumber }';
}


class AuthenticatedWithEmail extends AuthenticationState{

  final String email;

  AuthenticatedWithEmail ({this.email}) : super([email]);

  String toString() => 'Authenticated { email: $email }';

}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';
}