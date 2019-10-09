import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/board_drop_location/board/bloc/boardingpoints_bloc.dart';
import 'package:mimi/board_drop_location/board/bloc/boardingpoints_state.dart';
import 'package:mimi/board_drop_location/board/board_radio_button.dart';

class MainBoardLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardingpointsBloc,BoardingpointsState>(
      builder: (_,state){
        if(state is LoadingBoardingpointsState){
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
            child: CircularProgressIndicator(),
          );
        }

        if(state is ErrorBoardingPointsState){
          return Material(
            child: Center(
              child: Text('${state.error}'),
            ),
          );
        }
        if(state is FetchAllBoardingPointsState){
          return BoardLocationPage(locations: state.boardingPoints);
        }
      },
    );
  }
}

class BoardLocationPage extends StatelessWidget {
  final TabController tabController;
  final List<dynamic> locations;

  BoardLocationPage({this.tabController,this.locations});
  
  // final List<String> _boarding =[
  //   'Ubungo Bus stand',
  //   'Kimara Stop Over',
  //   'Mbezi Bus stand',
  //   'Kibaha Stand',
  //   'Chalinze Bus Stand'
  // ];



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
   
   return Row(

    children: <Widget>[
      BoardRadioButton(
      radioValue: locations[index],),
      Text(locations[index]),
    
    ],
  );
 }
 
}

