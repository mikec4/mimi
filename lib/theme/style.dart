import 'package:flutter/material.dart';

ThemeData appTheme(){
  TextTheme _textTheme(TextTheme theme){
    return theme.copyWith(
     
      headline: theme.headline.copyWith(
       // fontFamily: 'Arsenal',
       fontFamily: 'OpenSans',
        fontSize: 14.0, 
        //fontWeight: FontWeight.w800,
        color: Colors.white, 
      ),

      subhead: theme.subhead.copyWith(
       fontSize: 13.5,
       color: Colors.white,
      // fontWeight: FontWeight.w600,
       fontFamily: 'OpenSans'
     ),

      title: theme.title.copyWith(
        fontFamily: 'OpenSans',
        fontSize: 13.5,
        fontWeight: FontWeight.w800,
        color: Colors.black
      ),
      subtitle: theme.subtitle.copyWith(
        fontFamily: 'OpenSans',
        //fontWeight: FontWeight.w100,
        fontSize: 13.5,
        color: Colors.black
      ),
      

      display1: theme.display1.copyWith(
        fontFamily: 'OpenSans',
        color: Colors.grey,
        fontWeight: FontWeight.w800,
        fontSize: 13.5
      ),
      display2: theme.display2.copyWith(
        fontFamily: 'OpenSans',
        color: Colors.grey,
        fontSize: 13.5
      ),

      // Display textfield texts in red color 
      display3: theme.display3.copyWith(
        fontFamily: 'OpenSans',
        color: Colors.red,
        fontSize: 13.5
      ),
      display4: theme.display4.copyWith(
        fontFamily: 'OpenSans',
        fontSize: 14.0,
        color: Colors.grey
      ),

    /*
      body1 and body2 will be used in searched cities to travel
    */     
     body1: theme.body1.copyWith(
       fontFamily: 'OpenSans',
       color: Colors.black,
       fontSize: 13.5
     ),
     body2: theme.body2.copyWith(
       fontFamily: 'OpenSans',
       color: Colors.black,
       fontSize: 13.5
     ),
     
     caption: theme.caption.copyWith(
       fontFamily: 'OpenSans',
       color: Colors.black,
       fontSize: 13.0
     ),
     overline: theme.overline.copyWith(
       fontFamily: 'OpenSans',
       color: Colors.green,
       fontSize: 13.5
     ),
     button: theme.button.copyWith(
       fontSize: 13.5,
       fontFamily: 'OpenSans',
       color: Colors.black
     ),

      
    );
  }
  
  final ThemeData _themeData = ThemeData.light();
  return _themeData.copyWith(
    
    textTheme: _textTheme(_themeData.textTheme),
    primaryColor: Colors.black,
    accentColor: Colors.grey,
    splashColor: Colors.transparent,
    indicatorColor: Colors.black,
    cursorColor: Colors.black,
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 20.0
    ),
    
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.grey,
      
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
      disabledColor: Colors.grey,
      height: 40.0,
      minWidth: 250.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      elevation: 0.5,

     ),
    
    
    // inputDecorationTheme: InputDecorationTheme(

    //   labelStyle: TextStyle(
    //     color: Colors.grey,
    //     fontSize: 16.0
    //   ),
    //   contentPadding: EdgeInsets.only(right:10.0,top: 0.0,bottom: 10.0,left: 0.0), 
       
    //   enabledBorder: UnderlineInputBorder(
    //     borderSide: BorderSide(
    //       color: Colors.grey,
    //       width: 2.0
    //      ),
    //    ),
    //     focusedBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.black,
    //         width: 2.0
    //       ),
    //     ),
    //     focusedErrorBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.red,
    //         width: 2.0
    //       ),
    //     ),
    //     errorBorder: UnderlineInputBorder(
    //       borderSide: BorderSide(
    //         color: Colors.red,
    //         width: 2.0
    //       ),
    //     )
    // ),
    
  );
}