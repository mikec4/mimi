
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/board_drop_location/drop/bloc/dropingpoints_bloc.dart';
import 'package:mimi/board_drop_location/drop/bloc/dropingpoints_state.dart';
import 'package:mimi/board_drop_location/drop/drop_radio_button.dart';

class MainDropLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropingpointsBloc,DropingpointsState>(
      builder: (_,state){
        if(state is LoadingDropingpointsState){
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: CircularProgressIndicator(),
          );
        }
        
        if(state is ErrorDropingPointsState){
          return Material(
            child: Center(
              child: Text('${state.error}'),
            ),
          );
        }
       
        if(state is FetchAllDropingPointsState){
          return DropLocationPage(locations: state.items,);
        }
      },
    );
  }
}

class DropLocationPage extends StatelessWidget {
  final List<dynamic> locations;
  
  final  List<String> _drops = ['Kahama Stand','Isaka Stand'];

  DropLocationPage({Key key, this.locations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: ListView.separated(
        separatorBuilder: (context,i) => Container(height: 0.5,color: Colors.black,),
        itemCount: locations.length,
        itemBuilder: (context,i) =>
         Column(
           children: <Widget>[
             _radioRow(i),
            // _customDivider()
           ],
         ),
      ),
    );
    
  }

  Widget _radioRow(int index){

    return  Row(

      children: <Widget>[
        DropRadioButton(radioValue: locations[index],),
        Text(locations[index]),
      ],
    );
  }

  
  
}
