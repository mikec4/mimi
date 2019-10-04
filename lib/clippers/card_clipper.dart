import 'package:flutter/material.dart';

class CardClipper extends CustomClipper<Path> {

  double radius;

  CardClipper({this.radius});
  

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    
    path.addOval(Rect.fromCircle(
      center: Offset(0.0, size.height * 0.7),radius: radius
    ));

    path.addOval(Rect.fromCircle(
      center: Offset(size.width,size.height * 0.7),radius: radius
    ));

    path.addOval(Rect.fromCircle(
      center: Offset(0.0, size.height * 0.2),radius: radius
    ));

    path.addOval(Rect.fromCircle(
      center: Offset(size.width,size.height * 0.2),radius: radius
    ));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }


}