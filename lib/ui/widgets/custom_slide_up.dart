import 'package:flutter/material.dart';
import 'package:mimi/bus/slide_panel/panel_page2.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomSlideUp extends StatelessWidget {
  final double currentFare;
  final List currentSeats;
  final VoidCallback navigate;
  final Widget child;

  CustomSlideUp({this.currentSeats,this.currentFare,this.navigate,this.child,});

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      body: child,
      color: Colors.grey[100],
       minHeight: 55.0,
       isDraggable: false,
       backdropColor: Colors.black26,
       backdropEnabled: true,
       backdropTapClosesPanel: true,
       backdropOpacity: 0.8,
       panel: PanelPage2(
         buttonStatus: 'PAY',
         navigation: navigate,
         currentSeats: currentSeats,
         currentFare: currentFare,
      ),
    );
  }

  
}