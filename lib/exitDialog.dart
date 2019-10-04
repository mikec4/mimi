import 'package:flutter/material.dart';

class ExitDialog {
  
  showExitDialog(BuildContext context){
     return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
            ),
            title: Text('Do you want to exit this app'),
            actions: <Widget>[
              FlatButton(
                color: Colors.white,
                child: Text('No', style: TextStyle (color: Colors.blue,fontSize: 14.0),),
                onPressed: () => Navigator.pop(context, false),
              ),

              FlatButton(
                color: Colors.white,
                child: Text('Yes', style: TextStyle (color: Colors.blue,fontSize: 14.0),),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          );
        }
    );
  }
}