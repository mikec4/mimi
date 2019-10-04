import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: SpinKitRing(
          duration: Duration(milliseconds: 300),
          
          size: 40.0,
          lineWidth: 4,
          color: Colors.green,
        ),
      );
  }
}
