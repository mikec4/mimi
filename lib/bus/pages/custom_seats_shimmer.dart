import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mimi/seat/pages/seatButton.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class CustomSeatsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _mainBody();
  }

  
 
Widget _seatColumn1(){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Padding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.9),),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
        
        ],
      );
  }

  Widget _seatColumn2(){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Padding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.9),),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
        
        ],
      );
  }

  Widget _seatColumn3(){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Padding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.9),),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
        ],
      );
  }

  Widget _seatColumn4(){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Padding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.9),),
          SeatButton(),
          _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         _sizedBox(),
          SeatButton(),
         //SizedBox(height: 10.0,),
         _sizedBox(),
          SeatButton(),
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
        child: Shimmer.fromColors(
          baseColor: Colors.grey,
          direction: ShimmerDirection.ltr,
          enabled: true,
          highlightColor: Colors.indigo,
          loop: 2,
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
      ),
    );
  }

 
}