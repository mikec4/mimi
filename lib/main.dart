import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/authenticate/bloc/authentication_event.dart';
import 'package:mimi/locator.dart';
import 'package:mimi/login/bloc/login_bloc.dart';
import 'package:mimi/utils/main_app.dart';

import 'authenticate/bloc/authentication_bloc.dart';




Future<void>  main() async {
  
  

  await setupLocator();
  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
   

  runApp(
    BlocProvider(
      builder: (context) => AuthenticationBloc() ..add(AppStarted()),
      child: MyApp()
    )
  );


}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Teaser(),
//       theme: ThemeData(
//         primaryColor: Colors.purple
//       ),
//     );
//   }
// }


class MyApp extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      builder: (_) => LoginBloc(),
      child:MainApp(),
      );
    
    
  }
}












