import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/home/pages/bottom_navigation_page.dart';
import 'package:mimi/login/bloc/bloc.dart';
import 'package:mimi/login/bloc/login_bloc.dart';

class GoogleLoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocListener<LoginBloc,LoginState>(
      listener: (context, state){
       
      },
      child: BlocBuilder<LoginBloc,LoginState>(
        builder: (context,state){

          if(state is LoadingLoginState){
            return Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }

          if(state is ErrorLoginState){
            return Material(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: Text('${state.message}'),
              ),
            );
          }

          if(state is GoogleLoginState){
            
            return BottomNavigationPage();
          }
        },
      ),
    );
  }
}