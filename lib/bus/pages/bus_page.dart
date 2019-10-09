import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/bus/bloc/bloc.dart';
import 'package:mimi/bus/bloc/bus_bloc.dart';
import 'package:mimi/bus/slide_panel/main_panel.dart';
import 'package:mimi/searchResult/searchModel/search_bus.dart';
import 'package:intl/intl.dart';
import 'package:mimi/utils/size_config.dart';



class BusPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusBloc,BusState>(
      builder: (context, state){
        if(state is LoadBusState){
          return _loader();
        }
        if(state is ErrorBusState){
          return _errorWidget(state.message);
        }

        if(state is GetSelectedBusState){
          return BusSeatBody(currentBus: state.selectedBus,);
          
        }
      },
    );
  }

  Widget _loader(){
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: CircularProgressIndicator(),
    );
  }

  Widget _errorWidget(String e){
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Text('$e'),
    );
  }
}


class BusSeatBody extends StatelessWidget {
  
  final SearchBus currentBus;

  BusSeatBody({this.currentBus});

  @override
  Widget build(BuildContext context) {

   return Material(
     child: Container(
       child: CustomScrollView(
         slivers: <Widget>[
           SelectedBusHeader(currentBus: currentBus,),
           SliverToBoxAdapter(
            child: MainPanel(fare: currentBus.fare,),
          )
         ],
        ),
      ),
    );
  }
 

}




class SelectedBusHeader extends StatelessWidget {

  final SearchBus currentBus;

  SelectedBusHeader({this.currentBus});
  @override
  Widget build(BuildContext context) {
    return _sliverAppBar(context);
  }
  
  Widget _sliverAppBar(BuildContext context){

    var dateFormat = DateFormat("EEEE,d MMMM yyyy");

    return SliverAppBar(
      title: Row(children: <Widget>[
                Text(currentBus.name ??'Dar Lux' ,style: TextStyle(fontSize: 15.0),),
                Spacer(),
                Text(currentBus.registrationNumber ??'T123 ABC',
                style: TextStyle(fontSize: 13.0),),
              ],),
             // expandedHeight: 130.0,
              expandedHeight: SizeConfig.blockVerticalSize * 18.3,
              pinned: false,
              floating: true,
              bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, SizeConfig.blockVerticalSize * 2.5),

                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Spacer(),
                        Text('${dateFormat.format(currentBus.departureDate.toDate())}' ??'Not available',style: TextStyle(color: Colors.white),),
                        SizedBox(width: SizeConfig.blockHorizontalSize * 2.8,)
                      ],
                    ),
                    SizedBox(height: SizeConfig.blockVerticalSize * 1.5,),
                    FittedBox (
                      fit: BoxFit.contain,
                      child: Row (
                        children: <Widget>[
                          _seatHeader ("Females", Colors.pink,context),
                          SizedBox (width: SizeConfig.blockHorizontalSize * 4.0,),
                          _seatHeader ('Males', Colors.cyan,context),
                          SizedBox(width: SizeConfig.blockHorizontalSize * 4.0,),
                          _seatHeader('Selected', Colors.green,context)
                        ],
                      ),
                     ),
                    Padding (padding: EdgeInsets.only (bottom: SizeConfig.blockVerticalSize * 2.6),)

                  ],
                ),
              ),
            );
            

  }
 

  Widget _seatHeader(String status,Color color,BuildContext context){
    return  Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(SizeConfig.blockHorizontalSize * 2.2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color
          ),
                        
        ),
        SizedBox(width: SizeConfig.blockHorizontalSize * 2.4,),
        Text(
          status,
          style: Theme.of(context).textTheme.subtitle,
          )
      ],
    );
   }


}