import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/home/pages/bottom_navigation_page.dart';
import 'package:mimi/login/bloc/bloc.dart';
import 'package:mimi/login/bloc/login_bloc.dart';
import 'package:pinput/pin_put/pin_put.dart';

class MobileLoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
      builder: (context,state){

        if(state is LoadingLoginState){
          return Container(
            alignment: Alignment.center,
            color: Colors.white,
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
       
        if(state is VerifyMobileNumberLoginState){
          
         return  BottomNavigationPage();

        }
      },
    );
  }
}


class CustomPinPut extends StatefulWidget {

  final String verificationId;

  CustomPinPut({this.verificationId});

  @override
  _CustomPinPutState createState() => _CustomPinPutState();
}

class _CustomPinPutState extends State<CustomPinPut> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(),
      body: _pinPut(),
    );
  }

  Widget _pinPut(){
    return Container(
       alignment: Alignment.center,
       padding: EdgeInsets.symmetric(horizontal: 20.0),
       child: PinPut(
         clearInput: true,
         onClear: (value){
           value = '';
         },
         keyboardType: TextInputType.number,
         fieldsCount: 6,
         onSubmit: _showSnackBar,
       ),
     );
   
   
  }

  void _showSnackBar(String pin) async {

    BlocProvider.of<LoginBloc>(context).
    dispatch(LoginWithMobileNumberLoginEvent(smsCode: pin,verificationId: widget.verificationId));
    //Navigator.push(context, MaterialPageRoute(builder: (_) => MobileCodeHomePage()));
 
  }

  SnackBar _snackBar({String text, Color backgroundColor}){
    return SnackBar(
      duration: Duration(seconds: 5),
      content: Container(
          height: 50.0, 
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 17.0),
            ),
          )),
      backgroundColor: backgroundColor,
    );
  }
}