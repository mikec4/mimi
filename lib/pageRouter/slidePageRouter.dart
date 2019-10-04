import 'package:flutter/material.dart';

class SlidePageRouter extends PageRouteBuilder{
  Widget child;
  SlidePageRouter({@required this.child}) : super(
    maintainState: true,
    pageBuilder:(BuildContext context,Animation<double> animation,Animation<double> secondAnimation,) => child,
    transitionDuration: Duration(milliseconds: 170),
    transitionsBuilder: (BuildContext context,
    Animation<double> animation,Animation<double> secondAnimation,child) => 
      SlideTransition(
         position: Tween<Offset>(begin: Offset(2.0,0.0),end: Offset.zero)
         .animate(
           CurvedAnimation( 
             parent: animation,
             curve: Curves.decelerate,
             reverseCurve: Curves.decelerate
           )
         ),
          child: child,
      
       ),
    );
 
}