
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mimi/board_drop_location/master_location.dart';

import 'package:mimi/conditions/privacy_policy.dart';
import 'package:mimi/conditions/terms_conditions.dart';

import 'package:mimi/home/pages/home_page.dart';
import 'package:mimi/pageRouter/slidePageRouter.dart';


class Router{

  static Route<dynamic> onGenerateRoute(RouteSettings setting){
    switch(setting.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> HomePage());
     
      case '/backToHome':
        return SlidePageRouter(child: HomePage());
      case '/homePage':
        return SlidePageRouter(child:HomePage());
     

      case '/masterLocation':
        return SlidePageRouter(child: MasterLocation());
    
      case '/termsConditions':
        return SlidePageRouter(child: TermsConditions());
        case '/privacyPolicy':
        return SlidePageRouter(child: PrivacyPolicy());
      default:
       
    }
  }
}