import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mimi/passenger/model/passenger.dart';
import 'package:mimi/payment/entity/payment_entity.dart';

@immutable
abstract class PaymentEvent extends Equatable {
  PaymentEvent([List props = const <dynamic>[]]) : super(props);
}

class MakePaymentEvent extends PaymentEvent{

  final List<Passenger>  passengers;

  MakePaymentEvent({this.passengers});

  @override
  String toString() {
    return 'Make payment event';

  }


}
