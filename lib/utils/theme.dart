import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(

  fontFamily: 'NotoSerif',
  primarySwatch: Colors.purple,
  accentColor: Colors.purpleAccent,
  textTheme: TextTheme(
    title: TextStyle(
      color: Colors.white,
      fontFamily: 'NotoSerif'
      ),
    subtitle: TextStyle(
      fontFamily: 'NotoSerif',
      color: Colors.white,
      ),
      ),
    tabBarTheme: TabBarTheme(
      
      labelColor: Colors.black,
      labelStyle: TextStyle(
        fontFamily: 'NotoSerif',
        color: Colors.black,),
      unselectedLabelColor: Colors.black45, 
  ), 

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      fontFamily: 'NotoSerif'
    ),

  )         
);