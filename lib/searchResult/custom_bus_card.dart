import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mimi/utils/size_config.dart';

class CustomBusCard extends StatelessWidget {
  final String busName;
  final String fare ;
  final String busType;
  final String departureTime;
  final String arriveTime;

  const CustomBusCard({
    Key key, 
    this.busName, 
    this.fare,
    this.busType,
    this.departureTime,
    this.arriveTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Card(
       //shape: RoundedRectangleBorder(),
       elevation: 2.0,
       child: Container(
         //padding: EdgeInsets.all(15.0),
         padding: EdgeInsets.all(SizeConfig.blockVerticalSize * 2.03),
         child: Column(
           children: <Widget>[
             Row(
               children: <Widget>[
                 Text(departureTime ?? '',
                 style: TextStyle(
                   fontWeight: FontWeight.normal,
                  // fontSize: 16.0
                   ),
                 ),
                 Icon(
                   MdiIcons.minus,
                   //size: 19.0,
                   size: SizeConfig.blockVerticalSize * 2.57,
                   ),
                 Text(
                   arriveTime ?? '',
                   style: TextStyle(
                     fontWeight: FontWeight.normal,
                     color: Colors.grey,
                     //fontSize: 17.0
                     ),
                    ),
                //  Spacer(),
                //  Badge(
                //    elevation: 1.0,
                //    badgeColor: Colors.greenAccent,
                //    animationType: BadgeAnimationType.scale,
                //    toAnimate: true,
                //    animationDuration: Duration(milliseconds: 100),
                //    badgeContent: Text('10',style: TextStyle(color: Colors.white,fontSize: 9.0),),
                //  )
               ],
             ),

            // SizedBox(height: 5.0 ,),
            _smallBox(),
             Row(
               children: <Widget>[
                 Text(
                   busName ?? 'Dar Lux Tours',
                   style: TextStyle(
                     fontWeight: FontWeight.w600,
                     fontSize: SizeConfig.blockVerticalSize * 2.162
                     )
                     ),
                 Spacer(),
                 Text(
                   '${_formatter(double.parse(fare))}',
                   style: TextStyle(
                     fontWeight: FontWeight.w600,
                     //fontSize: 18.0,
                     color: Colors.red
                     )
                     )
               ],
             ),
             _smallBox(),
              Row(
               children: <Widget>[
                 Text(
                   '$busType'??'Zhotong Luxury Coach (2+2)',
                   style: TextStyle(
                     fontWeight: FontWeight.normal,
                    // fontSize: 14.5,
                    fontSize: SizeConfig.blockVerticalSize * 1.99,
                     color: Colors.grey[500])),
                 Spacer(),
               ],
             ),
           ],
         ),
       ),
     );
  }

  Widget _smallBox(){
    return SizedBox(
      height: SizeConfig.blockVerticalSize * 0.68,
    );
  }

  String _formatter(double fare){
    return FlutterMoneyFormatter(
      amount: fare,
      settings: MoneyFormatterSettings(
        symbol: 'Tsh',
        thousandSeparator: ','
      )
    ).output.symbolOnLeft;
  }
}