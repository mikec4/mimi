import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/passenger/passengerProvider/passenger_controller.dart';
import 'package:mimi/payment/bloc/bloc.dart';
import 'package:provider/provider.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<PassengerController>(context);

    return BlocBuilder<PaymentBloc,PaymentState>(
      builder: (context, state){
        if(state is LoadPaymentState){
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }

        if(state is ErrorPaymentState){
          return Container(
            alignment: Alignment.center,
            child: Text(state.message),
          );
        }


        if(state is SuccessPaymentState){
          
            return Scaffold(
            appBar: AppBar(title: Text('Success Page'),),
            body: ListView.builder(
              itemCount: state.passengerIds.length,
              itemBuilder: (context,i) => ListTile(title: Text(state.passengerIds[i] ?? 'Empty'),),
            ),
          );
        
        }
      },
    );
  }
}