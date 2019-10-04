import 'package:flutter/material.dart';

class SlideRouter extends PageRouteBuilder{
  Widget child;
  SlideRouter({this.child}) : super(
    maintainState: true,
    pageBuilder:(BuildContext context,Animation<double> animation,Animation<double> secondAnimation,) => child,
    transitionDuration: Duration(milliseconds: 200),
    transitionsBuilder: (BuildContext context,
    Animation<double> animation,Animation<double> secondAnimation,child) => 
     SlideTransition(
       position: Tween<Offset>(begin: Offset(0.0,2.5),end: Offset.zero).
        animate(CurvedAnimation(
          parent: animation,
          curve: Curves.fastLinearToSlowEaseIn
        )),
      child: child
    )
 );
}