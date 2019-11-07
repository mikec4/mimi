
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/home/date_time/date_picker.dart';
import 'package:mimi/home/homeProvider/home_provider.dart';


import 'package:mimi/searchResult/bloc/search_bloc.dart';
import 'package:mimi/searchResult/bloc/search_event.dart';
import 'package:mimi/searchResult/pages/search_page.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'custom_drop_down_menu.dart';


class HomePage extends StatefulWidget {
  @override
  _TeaserState createState() => _TeaserState();
}

class _TeaserState extends State<HomePage> {

 
 static const home_page = '/homePage';


  List<String> _from = [
   'Dar es salaam','Musoma','Mwanza','Kahama','Kigoma','Iringa'
  ];

  List<String> _destination = [
   'Dar es salaam','Mwanza','Kahama','Kigoma','Iringa','Musoma'
  ];



  HomeProvider _homeProvider;
 // SearchBloc _searchBloc;

  String _orignalLocation;
  String _destinationLocation;
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    _initialize();

    //_homeProvider = Provider.of<HomeProvider>(context);
    //_searchBloc = BlocProvider.of<SearchBloc>(context);

    // return   Consumer<HomeProvider>(

    //   builder: (context, consumer,_) {

    //     _orignalLocation = consumer.originalLocation;
    //     _destinationLocation = consumer.destination;
    //     _dateTime = consumer.date;

    //     _homeProvider = consumer;

        return Stack(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            
            Positioned.fill(
             // top: MediaQuery.of(context).size.height * 0.02,
             top: SizeConfig.blockVerticalSize * 8.0,  
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                     child: Text(
                       
                       'Yai',
                       key: Key('Yai'),
                       style: TextStyle(
                         fontFamily: 'NothingYouCouldDo',
                         fontSize: SizeConfig.blockVerticalSize * 5.0,color: Colors.white,fontWeight: FontWeight.w600
                         ),
                      ),
                  ),
                  SizedBox(height: SizeConfig.blockVerticalSize * 2,),
                  Container(
                    alignment: Alignment.center,
                    child: Text('Where are you going?',key:Key('Where'),style: TextStyle(fontSize: 18.0,color: Colors.white),),
                  ),
                  _cardContainer(),
                  SizedBox(height: SizeConfig.blockVerticalSize * 2.0),
                  _searchButton()
                  ],
                ),
              )
            ],
          );
     // }
    //);
  }


  void _initialize(){
    _homeProvider = Provider.of<HomeProvider>(context);
    _orignalLocation = _homeProvider.originalLocation;
    _destinationLocation = _homeProvider.destination;
    _dateTime = _homeProvider.date;
  }
 
  
 String duration ;

 Widget _cardContainer(){
  return  Container(

    padding: EdgeInsets.symmetric(
      vertical: 3.0 * SizeConfig.blockVerticalSize
      ,horizontal: SizeConfig.blockHorizontalSize * 2.5),
    child: Card(
      elevation: 10.0,
      child: Container(
        //height: SizeConfig.blockVerticalSize * 40
        height: SizeConfig.blockVerticalSize * 33.5,  
        child: Column(
          children: <Widget>[
            //DestinationDropDown(destinations: _destination,label: 'Destination',),
            //OriginalDropDown(originalLocations: _from,label: 'From',),
            CustomDropDownMenu(routes: _from,label: 'From',),
            CustomDropDownMenu(routes: _destination,label: 'Destination',),
            DatePicker()
          ],
        ),
      ),
    ),
  );
 }
 

 Widget _searchButton(){
   return Container(
     key: Key('SEARCH'),
     alignment: Alignment(0.0, SizeConfig.blockHorizontalSize * 0.09),
     child: MaterialButton(
       minWidth: SizeConfig.blockHorizontalSize * 80.0,
       height: SizeConfig.blockVerticalSize * 6.0,
       color: Colors.orangeAccent,
       disabledColor: Colors.grey,
       disabledElevation: 0.0,
       disabledTextColor: Colors.white,
       textColor: Colors.white,
       child: Text('SEARCH BUSES'),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(5.0)
       ),
       onPressed: _routeStatus() ? null : _onSearchBuses,
     ),    
  );
 }

 void _onSearchBuses() async{

    Map<String,dynamic> route = {
      "From": _orignalLocation,
      "To": _destinationLocation
    };

    //Map<String,dynamic> date = {"DepartureDate" : _dateTime};

    BlocProvider.of<SearchBloc>(context).add(SearchByName(dateTime: _dateTime,route: route));

    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));

 }

 bool _routeStatus(){

   return _homeProvider.originalLocation == null || _homeProvider.destination == null || 
   _homeProvider.date == null || _homeProvider.originalLocation == _homeProvider.destination;
 }

}


