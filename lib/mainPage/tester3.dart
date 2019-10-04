import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mimi/clippers/card_clipper.dart';
import 'package:mimi/mainPage/teaser.dart';
import 'package:mimi/searchResult/bloc/bloc.dart';
import 'package:mimi/searchResult/searchModel/search_bus.dart';
import 'package:mimi/searchResult/searchModel/search_bus_list.dart';

class Tester3 extends StatefulWidget {
  @override
  _Tester3State createState() => _Tester3State();
}

class _Tester3State extends State<Tester3> {



  @override
  void initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar(title: Text('Tester 3'),),
     body: BlocListener<SearchBloc,SearchState>(
      listener: (context,state){
        if(state is BusesSearchState){
          Scaffold.of(context).showSnackBar(
            SnackBar(

              content: Text('${state.searchBusList.buses.length} Buses found'),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.orangeAccent,
            )
          );
        }
      },
       child: BlocBuilder<SearchBloc,SearchState>(
         
          builder: (BuildContext context,SearchState state) {

            if(state is EmptySearchState) return _emptyValues();
            if(state is LoadSearchState) return _loading();
            if(state is ErrorSearchState) return _error(state.message);
            if(state is BusesSearchState) return _buildBody(searchBusList: state.searchBusList);
            
           },
  ),
     ),
   );
}

Widget _error(String error){
  return Container(
    child: Text('ERROR IS $error'),
  );
}
         
         
 
Widget _buildBody({SearchBusList searchBusList}){

  print('List of items is $searchBusList');

  return Material(
    child: ListView.builder(
      itemCount: searchBusList.buses.length,
      itemBuilder: (context,i){
       
        return ListTile(
            title: Text(searchBusList.buses[i].name),
            leading: Text(searchBusList.buses[i].route['From']),
            subtitle: Text(searchBusList.buses[i].route['To']),
          
        );
      },
    ),
  );
} 

Widget _emptyValues(){
  return Container(
    alignment: Alignment.center,
    child: Text('No data available here please'),
  );
}

Widget _loading(){
  return Container(
    color: Colors.white,
    alignment: Alignment.center,
    child: CircularProgressIndicator(),
  );
}
}