
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
   'Dar es salaam','Mwanza','Kahama','Kigoma','Iringa'
 ];

 List<String> _duration = ['Morning', 'Noon'];


 HomeProvider _homeProvider;
 SearchBloc _searchBloc;

  String _orignalLocation;
  String _destinationLocation;
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {

    _homeProvider = Provider.of<HomeProvider>(context);
    _searchBloc = BlocProvider.of<SearchBloc>(context);
    
    _orignalLocation = _homeProvider.originalLocation;
    _destinationLocation = _homeProvider.destination;
    _dateTime = _homeProvider.date;


    return   Material(
      
      child: Stack(
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
                     style: TextStyle(
                       fontFamily: 'NothingYouCouldDo',
                       fontSize: SizeConfig.blockVerticalSize * 5.0,color: Colors.white,fontWeight: FontWeight.w600
                       ),
                    ),
                ),
                SizedBox(height: SizeConfig.blockVerticalSize * 2,),
                Container(
                  alignment: Alignment.center,
                  child: Text('Where are you going?',style: TextStyle(fontSize: 18.0,color: Colors.white),),
                ),
                _cardContainer(),
                SizedBox(height: SizeConfig.blockVerticalSize * 2.0),
                _searchButton()
                ],
              ),
            )
          ],
        )
    );
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
            CustomDropDownMenu(routes: _from,label: 'From',),
            CustomDropDownMenu(routes: _destination,label: 'Destination',),
            //To be checked
            // Container(
            //   padding: EdgeInsets.only(top: 30.0,left: 15.0,right: 15.0),
            //   child: DropdownButtonFormField(
            //     onChanged: (value){
            //       setState(() {
            //         duration = value;
            //       });
            //     },

            //     value: duration,
            //     items: _duration.map((value) => DropdownMenuItem(
            //     value: value,
            //     child: Text(value,style: TextStyle(color: Colors.black)),
            //   )).toList(),
            //     decoration: InputDecoration(
            //     labelText: 'Duration',
            //     prefixIcon: duration == null ? Icon(MdiIcons.clock) : 
            //      duration.contains('Morning') ? Icon(MdiIcons.weatherSunsetUp,color: Colors.orangeAccent,):
            //       Icon(MdiIcons.weatherSunset,color: Colors.orangeAccent,),
            //     border: OutlineInputBorder()
            //   ),
            //   ),
            // ),
            DatePicker()
          ],
        ),
      ),
    ),
  );
 }
 

 Widget _searchButton(){
   return Container(
     alignment: Alignment(0.0, SizeConfig.blockHorizontalSize * 0.09),
     child: MaterialButton(
      //  minWidth: 300.0,
      //  height: 50.0,
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

    _searchBloc.dispatch(SearchByName(dateTime: _dateTime,route: route));

    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));

 }

 bool _routeStatus(){

   return _homeProvider.originalLocation == null || _homeProvider.destination == null || 
   _homeProvider.date == null || _homeProvider.originalLocation == _homeProvider.destination;
 }

}


