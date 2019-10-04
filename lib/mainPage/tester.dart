import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mimi/mainPage/tester2.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Tester extends StatefulWidget {
  @override
  _TesterState createState() => _TesterState();
}

class _TesterState extends State<Tester> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: PinFieldAutoFill(
            //     decoration: ,
            //     autofocus: false,
            //     codeLength: 6,
            //     onCodeSubmitted: (sms){
                  
            //     },
            //   ),
            // ),
            Padding(padding: EdgeInsets.only(bottom: 10.0),),
            MaterialButton(
              color: Colors.blue,
              minWidth: 300.0,
              height:50.0,
              child: Text('Navigate'),
              onPressed: (){
                Navigator.push(context, _pageRouter());
              },
            ),
          ],
        ),
      ),
    );
  }

  PageRouteBuilder _pageRouter(){
    return PageRouteBuilder(
      maintainState: true,
      pageBuilder: (context,animation,second) => Tester2(),
      transitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (context,animation,second,child) => 
       SlideTransition(
         position: Tween<Offset>(begin: Offset(-2.0,0.0),end: Offset.zero).animate(animation),
         child: child,
         ),
      barrierDismissible: true
    );
  }

 
}



