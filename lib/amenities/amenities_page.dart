import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/amenities/bloc/amenities_bloc.dart';
import 'package:mimi/amenities/bloc/bloc.dart';


class MainAmenitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AmenitiesBloc,AmenitiesState>(
      builder: (context,state){
        if(state is LoadingAmenitiesState){
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
        if(state is ErrorAmenitiesState){
          return Material(
            child: Center( 
              child: Text("${state.error}"),
            ),
          );
        }
        if(state is FetchAllAmenitiesState){
          return AmenitiesPage(amenities: state.items);
        }
      },
    );
  }
}
class AmenitiesPage extends StatelessWidget {
  final List<dynamic> amenities;

  AmenitiesPage({this.amenities});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          itemCount: amenities.length,
          itemBuilder: (context,i){
            return Card(
              elevation: 0.0,
              child: Container(
                padding: EdgeInsets.only(left: 5.0),
                height: 40.0,  
                child: Row(
                  children: <Widget>[
                    Text("${i+1}."),
                    SizedBox(width: 10.0,),
                    Text(amenities[i])
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}