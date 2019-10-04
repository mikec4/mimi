import 'package:flutter/material.dart';
import 'package:mimi/utils/size_config.dart';


 class SelectedSeatsContainer extends StatelessWidget {
  final String buttonStatus;
  final VoidCallback navigation;
  final List<dynamic> currentSeats;
  final double currentFare;

 SelectedSeatsContainer({this.buttonStatus,this.navigation,this.currentSeats,this.currentFare}): 
  assert(currentSeats != null && buttonStatus != null);

  @override
 Widget build(BuildContext context) => _buildMenuBody(context);
    
  
 Widget _buildMenuBody(BuildContext context){
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 1.0,),
          Text(
            'Selected Seats:  ${currentSeats.length}',
            //style: Theme.of(context).textTheme.subtitle,
            ),
          Text(
            '$currentFare',
           // style: Theme.of(context).textTheme.title,
            ),
          MaterialButton(
            child: Text('$buttonStatus',
            //style: Theme.of(context).textTheme.subhead,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(0.0))
            ),
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            //minWidth: 100.0,
            minWidth: SizeConfig.blockHorizontalSize * 27.8,
            height: SizeConfig.blockVerticalSize * 7.43,
           // height: 55.0,
            onPressed: navigation,
            
          )
        ],
      ),
    );
  }

}



 