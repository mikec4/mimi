import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mimi/pageRouter/fadeRouter.dart';
import 'package:mimi/searchResult/filter/filter.dart';

class CustomAppBar extends StatefulWidget {

  final Map<String,dynamic> bus;

  CustomAppBar({this.bus});
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  Map<String,dynamic> get bus=> widget.bus;
  @override
  Widget build(BuildContext context) {
    return _busAppBar2();
  }

   _busAppBar2(){
     return AppBar(
      bottom: _prefferedSize(),
      elevation:10.0,
  
     );
   }

  _busAppBar(){
    return SliverAppBar(
      bottom: _prefferedSize(),
      elevation:10.0,
      pinned: true,
      floating: false,
      expandedHeight: 40.0,
    );
  }


  _prefferedSize(){
    return PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60.0),
          child: Container(
            //padding: EdgeInsets.only(bottom: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(width:50.0),

                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${bus['Abbr']['From']}',
                          style: TextStyle(
                          color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w800),),
                          SizedBox(height: 5.0,),
                          Text('${bus['Route']['From']}',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.white,fontSize: 12.0,
                            fontWeight: FontWeight.w100))
                        ],
                      ),
                    ),
                    SizedBox(width: 100.0,),
                     Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${bus['Abbr']['To']}',
                          style: TextStyle(
                           // fontFamily: 'Raleway',
                            color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w900)),
                          SizedBox(height: 5.0,),
                          Text('${bus['Route']['To']}',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.white,
                            fontSize: 12.0,fontWeight: FontWeight.w200))

                        ],
                      ),
                    ),
                    SizedBox(width: 30.0,),
                    IconButton(
                      splashColor: Colors.transparent,
                      icon: Icon(FontAwesomeIcons.filter,color: Colors.white,size: 20.0,),
                      onPressed: (){
                        Navigator.push(context, FadeRouter(widget: Filter()));
                      },
                    )
                  ],
                ),
                SizedBox(height: 10.0,),
                _makeTimeBar()
              ],
            ),
          ),
        );
  }

   _makeTimeBar(){
    // var  timestamp = buses[1]['Date'];
    var timestamp = widget.bus['Date'];

     var dateFormat = DateFormat("EEEE,d MMMM yyyy");
     
     return Container(
           alignment: Alignment.center,
           color: Colors.pink[200],
           width: MediaQuery.of(context).size.width,
           height: 30.0,
           child: Text('${dateFormat.format(timestamp.toDate())}',
           style:Theme.of(context).textTheme.headline
           ),
         );
 }
//    _pageRouteBuilder(){
//    return PageRouteBuilder(
//      transitionDuration: Duration(milliseconds: 50),
//      transitionsBuilder: (context,animation,second,child){
//       return FadeTransition(
//         opacity: Tween<double>(begin: 0.0,end: 1.0). 
//         animate(CurvedAnimation(parent: animation,curve: Curves.easeInToLinear)),
//         child: child
//       );
//      },
//      pageBuilder: (context,animation,second) => LandingPage1()
//    );
//  }
}