
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:mimi/board_drop_location/board/board_provider.dart';
import 'package:mimi/board_drop_location/drop/drop_provider.dart';
import 'package:mimi/bus/busProvider/bus_controller.dart';
import 'package:mimi/login/pages/login_page.dart';
import 'package:mimi/login/provider/user_provider.dart';


import 'package:mimi/passenger/passengerProvider/passenger_controller.dart';
import 'package:mimi/payment/pages/provider/payments_method_controller.dart';
import 'package:mimi/searchResult/filter/filterProvider/filter_controller.dart';
import 'package:mimi/tickets/tickets_page.dart';

import 'package:provider/provider.dart';

import 'home/pages/home_page.dart';


List<SingleChildCloneableWidget> providers = [
  
  ChangeNotifierProvider<UserProvider>(
    builder: (_) => UserProvider(),
    child: LoginPage(),
  ),
  
  ChangeNotifierProvider<FilterController>(
    builder: (_) => FilterController(),
    child: HomePage(),
  ),

  StreamProvider<FirebaseUser>.value(
    value: FirebaseAuth.instance.onAuthStateChanged,
  ),

  ChangeNotifierProvider<PassengerController>(
    builder: (_) => PassengerController(),
    child: HomePage(),
  ),


 ChangeNotifierProvider<BusController>(
   builder: (_) => BusController(),
   child: HomePage(),
 ),

 ChangeNotifierProvider<BoardProvider>(
   builder: (_) => BoardProvider(),
   child: HomePage(),
 ),

 ChangeNotifierProvider<DropProvider>(
   builder: (_) => DropProvider(),
   child: HomePage(),
 ),
 ChangeNotifierProvider<PaymentMethodController>(
   builder: (_) => PaymentMethodController(),
   child: TicketsPage(),
 )
  
];

