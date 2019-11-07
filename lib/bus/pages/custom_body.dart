
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/bus/busProvider/bus_controller.dart';
import 'package:mimi/bus/pages/custom_seats_shimmer.dart';
import 'package:mimi/bus/pages/seats_counter.dart';

import 'package:mimi/seat/bloc/seat_bloc.dart';
import 'package:mimi/seat/bloc/seat_state.dart';
import 'package:mimi/seat/pages/seatsBody.dart';
import 'package:provider/provider.dart';


class CustomBody extends StatefulWidget {
  final VoidCallback openPanel;
  
  CustomBody({this.openPanel});

  @override
  _CustomBodyState createState() => _CustomBodyState();
}


class _CustomBodyState extends State<CustomBody> {

  VoidCallback get openPanel => widget.openPanel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeatBloc,SeatState>(
      builder: (context, state){
        if(state is LoadSeatState){
          return Container(
            alignment: Alignment(0.0,-0.3),
            color: Colors.white,
          );
        }
         
       // if(state is LoadSeatState) return CustomSeatsShimmer();
         if(state is ErrorSeatState){
           return Container(
             alignment: Alignment.center,
             child: Text(state.message),
           );
         }
         
        if(state is ListSeatState){
          return _build();
        }
      }
    );
  }

  Widget _build(){
    
    return Consumer<BusController>(
      builder: (context,controller,_){
      return  Container(
        child: Column(
          children: <Widget>[
            SeatsCounter(currentSeats: controller.seats,),
            SeatsBody(),
          ],
        ),
      );
      },
    );
  }


} 


class SeatsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}










