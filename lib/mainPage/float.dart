import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final startColor  = Colors.green;
final endColor = Colors.black;


class Float extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
            height: MediaQuery.of(context).size.height/5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [startColor,endColor],
                stops: [0.0,0.8]
              )
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/2.5,top: 40.0),
            child: Text('Passenger',style: Theme.of(context).textTheme.headline),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/3,top: 90.0),
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              color: Colors.grey,
              border: Border.all(
                color: Colors.white,
                width: 10.0
              )
            ),
            
          )
            ],
          ),
         

          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text('Michael Ntiriniga',style: Theme.of(context).textTheme.title,),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            child: Text('0759387704',style: Theme.of(context).textTheme.title,),
          ),

         
          
        ],
      ),
    );
  }
}
