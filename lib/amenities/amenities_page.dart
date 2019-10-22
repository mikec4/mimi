import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/amenities/bloc/amenities_bloc.dart';
import 'package:mimi/amenities/bloc/bloc.dart';
import 'package:mimi/utils/size_config.dart';


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
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockHorizontalSize * 2.788,
            vertical:SizeConfig.blockHorizontalSize * 2.78
            ),
          itemCount: amenities.length,
          itemBuilder: (context,i){
            return Card(
              elevation: 0.0,
              child: Container(
                padding: EdgeInsets.only(left: SizeConfig.blockHorizontalSize * 1.4),
                height: SizeConfig.blockVerticalSize * 6.76,  
                child: Row(
                  children: <Widget>[
                    Text("${i+1}."),
                    SizedBox(width: SizeConfig.blockHorizontalSize * 2.788),
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