
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'board_drop_location/board/board_provider.dart';
import 'board_drop_location/drop/drop_provider.dart';
import 'login/loginRepository/user_repository.dart';
import 'passenger/model/passenger.dart';
//import 'core/services/bus_service.dart';

GetIt locator = GetIt();

void setupLocator(){
  locator.registerLazySingleton(() => GlobalKey<FormState>());
  
  locator.registerSingleton(ScrollController());
  locator.registerSingleton(FocusScopeNode());

  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => Passenger());

  locator.registerLazySingleton(()=> DropProvider());
  locator.registerLazySingleton(()=> BoardProvider());

  locator.registerSingleton(GlobalKey<ScaffoldState>());
  
}