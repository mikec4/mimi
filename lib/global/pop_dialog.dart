import 'package:flutter/material.dart';

class PopDialog extends StatefulWidget {
  final Widget child;
  
  PopDialog({this.child});

  @override
  _PopDialogState createState() => _PopDialogState();
}

class _PopDialogState extends State<PopDialog> {
   @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onPop   ,
      child: widget.child,
    );
  }

  Future<bool> _onPop(){
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)
            ),
            title: Text('Do you want to exit this app',style: TextStyle(color: Colors.black),),

            actions: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
                
                color: Colors.grey,
                textColor: Colors.white,
                child: Text('No', style: TextStyle (fontSize: 14.0),),
                onPressed: () => Navigator.pop(context, false),
              ),
              RaisedButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: Text('Yes', style: TextStyle (color: Colors.white,fontSize: 14.0),),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          );
        }
    );
  }

 
}