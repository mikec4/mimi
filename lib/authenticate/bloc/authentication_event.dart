import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const <dynamic>[]]) : super(props);
}


class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedInWithEmail extends AuthenticationEvent {
  @override
  String toString() => 'LoggedIn with Email';
}

class LoggedInWithMobileNumber extends AuthenticationEvent{

  String toString() => 'LoggedIn With Mobile Number';

}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}
