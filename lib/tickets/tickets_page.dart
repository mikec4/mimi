
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/bus/bloc/bus_bloc.dart';
import 'package:mimi/bus/bloc/bus_state.dart';
import 'package:mimi/global/route_title.dart';
import 'package:mimi/passenger/passengerProvider/passenger_controller.dart';
import 'package:mimi/payment/pages/payments_method_page.dart';
import 'package:mimi/searchResult/searchModel/search_bus.dart';
import 'package:mimi/tickets/ticket_widget.dart'; 
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';

class TicketsPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    return Consumer<PassengerController>(
      builder: (context ,controller,_){
        return Scaffold(
          body: Stack(            
          children: <Widget>[
            Container(color: Theme.of(context).primaryColor,),
            Positioned.fill(
              top: 20.0,
              child: CustomTicketsList(
                controller: controller,
              ),
            )
          ],
        )
      );
      }
    );
  }

}


class CustomTicketsList extends StatelessWidget {
  final PassengerController controller;

  CustomTicketsList({this.controller});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<BusBloc,BusState>(
      builder: (context,state){
        if(state is GetSelectedBusState){
          
          print('PASSENGERS LIST ${controller.passengers.length}') ;
          
          return Scrollbar(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(title: Text('Passengers'),),
                SliverPadding(padding: EdgeInsets.only(top: SizeConfig.blockVerticalSize * 2.0),),
                SliverPadding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockHorizontalSize * 5.0,
                  ),
                  sliver: SliverList(
                    //itemExtent: SizeConfig.blockVerticalSize * 51.5,
                    delegate: SliverChildBuilderDelegate(
                      (context,i) => CustomTicket(selectedBus: state.selectedBus,index: i,),
                      childCount: controller.passengers.length
                    ),
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: SizeConfig.blockVerticalSize * 2.0),),
                SliverToBoxAdapter(child: ShareButton(),),
                SliverPadding(padding: EdgeInsets.only(top: SizeConfig.blockVerticalSize * 10.0),),
              ],
            ),
          );
        }
      }
    );
  }
 
}
 

class CustomTicket extends StatelessWidget {

  final SearchBus selectedBus;
  final int index;

  CustomTicket({
    Key key, 
    this.selectedBus,
    this.index,
    }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PassengerController>(
      builder: (context,controller,_) =>
      TicketWidget(
        passenger: controller.passengers[index],
        selectedBus: selectedBus,
      )
   
    ); 
  }
}
// 

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
     // height: MediaQuery.of(context).size.height * 0.072,
     // width: MediaQuery.of(context).size.width,
     height: SizeConfig.blockVerticalSize * 6.0,
     width: SizeConfig.blockHorizontalSize * 80.0,
      color: Colors.transparent,
      child: MaterialButton(
        elevation: 5.0,
        child: Text('CONTINUE BOOKING'),
        textColor: Colors.white,
        color: Colors.orangeAccent,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentsMethodPage()));
        },
      ),
    );
  }
}