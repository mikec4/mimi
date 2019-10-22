import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/land/main_home_page.dart';
import 'package:mimi/login/bloc/bloc.dart';
import 'package:mimi/login/bloc/login_bloc.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}
 

class _PasswordPageState extends State<PasswordPage> {


  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     key: _key,
     body: BlocBuilder<LoginBloc,LoginState>(
        builder: (_,state){

           if(state is LoadingLoginState){
             
             return Container(
               alignment: Alignment.center,
               child: CircularProgressIndicator(),
             );
           }

           if(state is ErrorLoginState){
             return Container(
               alignment: Alignment.center,
               child: Text('${state.message}') ,
             );
           }

          //  if(state is SuccessMobileNumberLoginState){

          //   if(state.success) return MainHomePage();
        
          //   else if(!state.success) return _pinPut();
            
          //  }
           
         },
       )
   );
  }
  
  
  Widget _pinPut(){
    return Container(
      
       alignment: Alignment.center,
       padding: EdgeInsets.symmetric(horizontal: 20.0),
       child: PinPut(
         clearInput: true,

         onClear: (value){
           value = '000000';
         },
         keyboardType: TextInputType.number,
         fieldsCount: 6,
         onSubmit: _showSnackBar,
       ),
     );
   
   
  }

  void _showSnackBar(String pin) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 5),
      content: Container(
          height: 50.0, 
          child: Center(
            child: Text(
              'Pin Submitted. Value: $pin',
              style: TextStyle(fontSize: 17.0),
            ),
          )),
      backgroundColor: Colors.greenAccent,
    );
    _key.currentState.showSnackBar(snackBar);
  }
}

