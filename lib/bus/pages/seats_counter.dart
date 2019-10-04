
import 'package:flutter/material.dart';


class SeatsCounter extends StatelessWidget {
 final List<String> currentSeats;
 
 SeatsCounter({this.currentSeats}): assert(currentSeats != null);

 @override
  Widget build(BuildContext context) {
   
    return _buildMainBody(context);
   
  }

  Widget _buildMainBody(BuildContext context){

    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.06,
      color: Colors.orangeAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width:MediaQuery.of(context).size.width * 0.25,),
          Text('Seats ',style:Theme.of(context).textTheme.subtitle),
          _seatsSelected(context)
        ],
      ), 
                  
    );
  }



  Widget _seatsSelected(BuildContext context) =>
     Flexible(
       child: Container(
         child: _selectedSeatsList(),
         padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.018,),
      )
  );
  

  Widget _selectedSeatsList(){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount:  currentSeats.length,
      itemBuilder: (context,i){
          return Text(",${currentSeats[i]}",style: Theme.of(context).textTheme.subtitle,);
      },
    );
  }


}