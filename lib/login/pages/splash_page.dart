import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text('Splash Screen here',style: TextStyle(color: Colors.white),),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}