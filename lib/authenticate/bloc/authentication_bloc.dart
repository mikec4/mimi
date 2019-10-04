import 'dart:async';
import 'dart:async' as prefix0;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mimi/authenticate/bloc/bloc.dart' as prefix1;
import 'package:mimi/locator.dart';
import 'package:mimi/login/loginRepository/user_repository.dart';
import './bloc.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final UserRepository _userRepository = locator<UserRepository>();
  
  // AuthenticationBloc({@required UserRepository userRepository}): assert(userRepository != null),
  //   _userRepository = userRepository;

  @override
  AuthenticationState get initialState => InitialAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {

     if (event is AppStarted) {

      yield* _mapAppStartedToState();

    } else if (event is LoggedInWithEmail) {

      yield* _mapLoggedInWithEmailToState();

    }  else if(event is LoggedInWithMobileNumber){
      
      yield* _mapLoggedInWithMobileNumberToState();

    } else if (event is LoggedOut) {

      yield* _mapLoggedOutToState();
      
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {

  try {

    final isSignedIn = await _userRepository.isSignedIn();

    if (isSignedIn) {

      final email = await _userRepository.getUserEmail();
      final mobile = await _userRepository.getUserNumber();

      if(email.length != null){
        yield AuthenticatedWithEmail(email: email);
      }
      else if(mobile != null){

        yield AuthenticatedWithMobileNumber(phoneNumber: mobile);
      }

    } else {

      yield Unauthenticated();
    }
  } catch (_) {

    yield Unauthenticated();
  }
}

Stream<AuthenticationState> _mapLoggedInWithEmailToState() async* {

  yield AuthenticatedWithEmail(email: await _userRepository.getUserEmail());
}

Stream<AuthenticationState> _mapLoggedInWithMobileNumberToState() async*{

  yield AuthenticatedWithMobileNumber(phoneNumber: await _userRepository.getUserNumber());
}

Stream<AuthenticationState> _mapLoggedOutToState() async* {
  yield Unauthenticated();
  _userRepository.signOut();
}

}
