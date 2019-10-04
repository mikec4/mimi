import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/passenger/model/passenger.dart';
import 'package:mimi/payment/paymentRepository/payment_repository.dart';
import './bloc.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  @override
  PaymentState get initialState => InitialPaymentState();

  @override
  Stream<PaymentState> mapEventToState(
    PaymentEvent event,
  ) async* {

    if(event is MakePaymentEvent){

      yield LoadPaymentState();

      try {
    
        final results = await _onMakePayment(event.passengers);

        yield SuccessPaymentState(passengerIds: results);

      } catch (error) {
        yield ErrorPaymentState(message: error.toString());
      }
    }
  }

  Future<List<String>> _onMakePayment(List<Passenger> passengers) async{

    List<String> _passengers = [];

    passengers.forEach((passenger) async {
      var id =  await PaymentRepository().makePayment(passenger);
      _passengers.add(id);
    });

    return _passengers;

  }
}
