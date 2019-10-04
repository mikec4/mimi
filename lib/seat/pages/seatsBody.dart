import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mimi/utils/size_config.dart';

import 'seatButton.dart';




class SeatsBody extends StatefulWidget {
  @override
  _SeatsBodyState createState() => _SeatsBodyState();
}

class _SeatsBodyState extends State<SeatsBody> {
  bool _isError = true;

  @override
  Widget build(BuildContext context) {
    return _mainBody();
  }
  

  

 
Widget _seatColumn1(){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Padding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.9),),
         SeatButton(seatIndex: 0,),
         _sizedBox(),
          SeatButton(seatIndex: 4,),
         _sizedBox(),
          SeatButton(seatIndex: 8,),
         _sizedBox(),
          SeatButton(seatIndex: 12,),
         _sizedBox(),
          SeatButton(seatIndex: 16,),
         _sizedBox(),
          SeatButton(seatIndex: 20,),
         _sizedBox(),
          SeatButton(seatIndex: 24,),
         _sizedBox(),
          SeatButton(seatIndex: 28,),
         _sizedBox(),
          SeatButton(seatIndex: 32,),
         _sizedBox(),
          SeatButton(seatIndex: 36,),
         _sizedBox(),
          SeatButton(seatIndex: 40,),
         _sizedBox(),
          SeatButton(seatIndex: 44,),
         _sizedBox(),
          SeatButton(seatIndex: 48,),
        //  SizedBox(height: 10.0,),
        //   SeatButton(seatIndex: 52,),
        //  SizedBox(height: 10.0,),
        //   SeatButton(seatIndex: 55,),
        ],
      );
  }

  Widget _seatColumn2(){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        // SeatButton( seatNumber: _bus.seats[1]['seatNumber'],),

         Padding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.9),),
          SeatButton( seatIndex: 1,),
         _sizedBox(),
          SeatButton(seatIndex: 5,),
         _sizedBox(),
          SeatButton(seatIndex: 9,),
         _sizedBox(),
          SeatButton(seatIndex: 13,),
         _sizedBox(),
          SeatButton(seatIndex:17,),
         _sizedBox(),
          SeatButton(seatIndex: 21,),
         _sizedBox(),
          SeatButton(seatIndex:25,),
         _sizedBox(),
          SeatButton(seatIndex: 29,),
         _sizedBox(),
          SeatButton(seatIndex: 33,),
         _sizedBox(),
          SeatButton(seatIndex: 37,),
         _sizedBox(),
          SeatButton(seatIndex: 41,),
         _sizedBox(),
          SeatButton(seatIndex: 45,),
         _sizedBox(),
          SeatButton(seatIndex: 49,),
        //  SizedBox(height: 10.0,),
        //   SeatButton(seatIndex: 53,),
        //  SizedBox(height: 10.0,),
        //   SeatButton(seatIndex: 57),
        ],
      );
  }

  Widget _seatColumn3(){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Padding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.9),),
          SeatButton(seatIndex: 2,),
         _sizedBox(),
          SeatButton(seatIndex: 6,),
         _sizedBox(),
          SeatButton(seatIndex: 10,),
         _sizedBox(),
          SeatButton(seatIndex: 14,),
         _sizedBox(),
          SeatButton(seatIndex: 18,),
         _sizedBox(),
          SeatButton(seatIndex: 22,),
         _sizedBox(),
          SeatButton(seatIndex: 26,),
         _sizedBox(),
          SeatButton(seatIndex: 30,),
         _sizedBox(),
          SeatButton(seatIndex: 34,),
         _sizedBox(),
          SeatButton(seatIndex: 38,),
         _sizedBox(),
          SeatButton(seatIndex: 42,),
         _sizedBox(),
          SeatButton(seatIndex: 46),
         _sizedBox(),
          SeatButton(seatIndex: 50,),
        //  SizedBox(height: 10.0,),
        //   SeatButton(seatIndex: 54,),
        //  SizedBox(height: 10.0,),
        //   SeatButton(seatIndex: 58,),
        ],
      );
  }

  Widget _seatColumn4(){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Padding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.9),),
          SeatButton(seatIndex: 3,),
          _sizedBox(),
          SeatButton(seatIndex: 7,),
         _sizedBox(),
          SeatButton(seatIndex: 11,),
         _sizedBox(),
          SeatButton(seatIndex: 15,),
         _sizedBox(),
          SeatButton(seatIndex: 19),
         _sizedBox(),
          SeatButton(seatIndex: 23,),
         _sizedBox(),
          SeatButton(seatIndex: 27,),
         _sizedBox(),
          SeatButton(seatIndex: 31,),
         _sizedBox(),
          SeatButton(seatIndex: 35,),
         _sizedBox(),
          SeatButton(seatIndex: 39,),
         _sizedBox(),
          SeatButton(seatIndex: 43,),
         _sizedBox(),
          SeatButton(seatIndex: 47,),
         //SizedBox(height: 10.0,),
         _sizedBox(),
          SeatButton(seatIndex: 51,),
        //  SizedBox(height: 10.0,),
        //   SeatButton(seatIndex: 55,),
        //  SizedBox(height: 10.0,),
        //   SeatButton(seatIndex:59,),
        ],
      );
  }

  Widget _sizedBox(){
    return SizedBox(
      height: SizeConfig.blockHorizontalSize * 2.8,
    );
  }

  Widget _seatRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
    
        _seatRow1(),
        _seatRow2(),
        _seatRow3()
      ],
    );
  }

  _seatRow1(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,      
      children: <Widget>[
      
        //SizedBox(width: 1.0,),
        SeatButton(),
        SizedBox(width: SizeConfig.blockHorizontalSize * 5.56,),
        SeatButton(),
        SizedBox(width: SizeConfig.blockHorizontalSize * 2.8,),
      ],
    );
  }

   _seatRow2(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,      
      children: <Widget>[
      
        SeatButton(),
        SizedBox(width: SizeConfig.blockHorizontalSize * 2.8,),
        SeatButton(),
        SizedBox(width: SizeConfig.blockHorizontalSize * 2.8,),
      ],
    );
  }

   _seatRow3(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,      
      children: <Widget>[
   
        SeatButton(),
        SizedBox(width: SizeConfig.blockHorizontalSize * 2.8,),
        SeatButton(),
      //  SizedBox(width: 20.0,),
      ],
    );
  }

   

  Widget get _upperSeats{
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      
        _seatColumn1(),SizedBox(width: SizeConfig.blockHorizontalSize * 5.56,),_seatColumn2(),
        SizedBox(width: SizeConfig.blockHorizontalSize * 22.22,),
        _seatColumn3(),SizedBox(width: SizeConfig.blockHorizontalSize * 5.56,),_seatColumn4()
      ],
    );
  }

  Widget _mainBody(){
    return Material(
      elevation: 0.0,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column( 
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.8),
              alignment: Alignment(SizeConfig.blockHorizontalSize * 0.15278,0.0),
              child: Icon(MdiIcons.steering,size: SizeConfig.blockHorizontalSize * 9.722,color: Colors.grey,),

            ),
             _upperSeats,
            SizedBox(height: SizeConfig.blockHorizontalSize * 2.8,),
            _seatRow(),
            SizedBox(height: SizeConfig.blockHorizontalSize * 2.8,),
          ],
        ),
      ),
    );
  }

 

}










