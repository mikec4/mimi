import 'package:flutter/material.dart';
import 'package:mimi/utils/size_config.dart';

class PanelPage2 extends StatelessWidget {

  final String buttonStatus;
  final VoidCallback navigation;
  final List<dynamic> currentSeats;
  final double currentFare;

  PanelPage2({this.buttonStatus,this.navigation,this.currentSeats,this.currentFare}):
  assert(currentSeats != null && buttonStatus != null && currentFare != null);

  @override
  Widget build(BuildContext context) {
    return _buildMain(context);
  }

  Widget _buildMain(BuildContext context){
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 1.0,),
          Text(
            'Selected Seats:  ${currentSeats.length }',
           // style: TextStyle(fontSize: SizeConfig.blockHorizontalSize * 4.444,fontWeight: FontWeight.w500),
            ),
          Text(
            '$_amount',
            //style: TextStyle(fontSize: SizeConfig.blockHorizontalSize * 4.444,fontWeight: FontWeight.w500),
            ),
          MaterialButton(
            child: Text('$buttonStatus',),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(0.0))
            ),
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            minWidth: SizeConfig.blockHorizontalSize * 27.78,
            height: SizeConfig.blockHorizontalSize * 18.06,
            onPressed: navigation,
            
          )
        ],
      ),
    );
  }

  double get _amount  =>  currentFare * currentSeats.length;
  
}