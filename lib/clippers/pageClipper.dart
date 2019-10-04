import 'package:flutter/material.dart';

class PageClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20.0);

    var firstControllPoint = Offset(size.width/4, size.height);
    var firstEndPoint = Offset(size.width/2.25,size.height - 30.0);
    
    path.quadraticBezierTo(firstControllPoint.dx, firstControllPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControllPoint = Offset(size.width - (size.width/3.25), size.height - 65.0);
    var secondEndPoint = Offset(size.width,size.height- 40.0);

    path.quadraticBezierTo(secondControllPoint.dx, secondControllPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
 
    //var controllPoint = Offset(size.width,size.height);
    //var endpoint = Offset(size.width,size.height);
    

    path.lineTo(size.width, size.height - 40.0);
    path.lineTo(size.width, 0.0);
    
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}