import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const <dynamic>[]]) : super(props);
}

class GoogleLoginEvent extends LoginEvent {
  @override
  String toString() => 'LoginWithGooglePressed';
}


class FacebookLoginEvent extends LoginEvent{

  @override
  String toString() => 'LoginWithFacebookPressed';
}




// FAILED AND I DON'T KNOW WHY
class VerifyMobileNumberLoginEvent extends LoginEvent{

  final String mobile;

  VerifyMobileNumberLoginEvent({@required this.mobile}) : super([mobile]);

  @override 
  String toString() => 'Mobile number login event';

  String internatinalizeNumber(String value) {

    final _countryCode = '+255';
    String _value = '';

    if(value.length == 10){

      List<String> splitted = value.split('').toList();
      splitted.removeAt(0);
      String raw =splitted.join();
      _value = _countryCode + raw;
    }

    return _value;

  }


}


class LoginWithMobileNumberLoginEvent extends LoginEvent{
  final String smsCode;
  final String verificationId;
  LoginWithMobileNumberLoginEvent({this.smsCode,this.verificationId}) : super([smsCode,verificationId]);

  @override
  String toString() => 'Mobile number login event';

}
