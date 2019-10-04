

import 'package:flutter/material.dart';

class FadeRouter extends PageRouteBuilder{
 Widget widget;
 FadeRouter({this.widget}) : super(
   maintainState: true,
   pageBuilder:(BuildContext context,Animation<double> animation,Animation<double> secondAnimation,) => widget,
   transitionDuration: Duration(milliseconds: 100),
   transitionsBuilder: (BuildContext context,
   Animation<double> animation,Animation<double> secondAnimation,child) => 
     FadeTransition(
      opacity: Tween<double>(begin: 0.0,end: 1.0). 
      animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeIn)),
      child: child
    )
 );
}