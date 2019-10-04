import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';

class SuccessWidget extends StatefulWidget {
  @override
  _SuccessWidgetState createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<SuccessWidget> {


  @override
  Widget build(BuildContext context) {
    //_navigate(context);
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
              height: 200.0,
              width: 200.0,
              child: FlareActor(
                 'assets/green.flr',animation: 'success',sizeFromArtboard: true,)

          ),
        ],
      ),
    );
  }

  void _navigate(BuildContext context){

    Future.delayed(Duration(seconds: 1),(){
     // Navigator.push(context, MaterialPageRoute(builder: (context)=> MasterSearch()));
    });
  }
}

