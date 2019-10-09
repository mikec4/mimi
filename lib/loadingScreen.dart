
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  final Widget next;
  final Color indicatorColor;
  LoadingScreen({this.next,this.indicatorColor});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
  Widget get next => widget.next;
  Color get color => widget.indicatorColor;

  @override
  void initState() {
    super.initState();
    
  }

  // _moveToAnotherPage(){
  //   Navigator.pushAndRemoveUntil(context,
  //       MaterialPageRoute(builder: (context)=> next), (route)=> false);
  // }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 130.0)),
                      FlutterLogo(
                        colors: Colors.green,
                        size: 120.0,
                      ),
//                      CircleAvatar(
//                        backgroundColor: Colors.white,
//                        radius: 50.0,
//                        child: Icon(FontAwesomeIcons.bus,size: 40.0,),
//                      ),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Text('Travelling is for everyone \n welcome on board',
                        style: TextStyle(color: Colors.black,fontSize: 18.0),),

                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpinKitFadingFour(
                      color: color== null? Colors.indigo: color,
                      duration: Duration(seconds: 5),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
