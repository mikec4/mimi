import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PaymentState extends Equatable {
  PaymentState([List props = const <dynamic>[]]) : super(props);
}

class InitialPaymentState extends PaymentState {}

class LoadPaymentState extends PaymentState{

  @override
  String toString() {
    // TODO: implement toString
    return 'Load Payment State';
  }

}

class SuccessPaymentState extends PaymentState{
  final List<String> passengerIds;

  SuccessPaymentState({this.passengerIds});

  @override
  String toString() {
    return 'Success Payment state';
  }


}


class ErrorPaymentState extends PaymentState{

  final String message;

  ErrorPaymentState({this.message});

 @override
  String toString() {
    // TODO: implement toString
    return 'Error message Payment state';
  }


}