import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/policy/bloc/bloc.dart';
import 'package:mimi/utils/size_config.dart';


class MainPoliciesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoliciesBloc,PoliciesState>(
      builder: (_,state){
        if(state is LoadingPoliciesState){
          return Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
        if(state is ErrorPoliciesState){
          return Material(
            child: Center(
              child: Text('${state.error}'),
            ),
          );
        }
        if(state is FetchAllPoliciesState){
          return PoliciesPage(policies: state.polices,);
        }
      },
    );
  }
}


class PoliciesPage extends StatelessWidget {
  final List<dynamic> policies;

  const PoliciesPage({Key key, this.policies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockHorizontalSize * 2.788,
            vertical: SizeConfig.blockHorizontalSize * 2.788,
            ),
          itemCount: policies.length,
          itemBuilder: (context,i){
            return Card(
              elevation: 0.0,
              child: Container(
                padding: EdgeInsets.only(left:SizeConfig.blockHorizontalSize * 1.4),
                height: SizeConfig.blockVerticalSize * 6.76,  
                child: Row(
                  children: <Widget>[
                    Text("${i+1}."),
                    SizedBox(width: SizeConfig.blockHorizontalSize * 2.788,),
                    Flexible(child: Container(child: Text(policies[i])))
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







