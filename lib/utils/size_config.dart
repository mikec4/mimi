import 'package:flutter/cupertino.dart';

class SizeConfig {
  
  static double blockHorizontalSize = 0.0;
  static double blockVerticalSize  = 0.0;
  static double screenWidth;
  static double screenHeight;


  void init(BoxConstraints constraints){
    screenWidth = constraints.maxWidth;
    screenHeight  = constraints.maxHeight;

    blockHorizontalSize = screenWidth / 100;
    blockVerticalSize = screenHeight / 100;


  }

  // static final SizeConfig _sizeConfig = SizeConfig._internal();

  // SizeConfig._internal();
  
  // factory SizeConfig(){
  //   return _sizeConfig;
  // }

}