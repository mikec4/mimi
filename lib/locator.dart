
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mimi/amenities/repository/amenities_repository.dart';
import 'package:mimi/board_drop_location/repository/location_repository.dart';

import 'board_drop_location/board/board_provider.dart';
import 'board_drop_location/drop/drop_provider.dart';
import 'login/loginRepository/user_repository.dart';
import 'passenger/model/passenger.dart';
import 'policy/repository/policies_repository.dart';
//import 'core/services/bus_service.dart';

GetIt locator = GetIt();

void setupLocator(){
  locator.registerLazySingleton(() => GlobalKey<FormState>());
  
  locator.registerSingleton(ScrollController());
  locator.registerSingleton(FocusScopeNode());
  
  locator.registerLazySingleton(() => PoliciesRepository());
  locator.registerLazySingleton(()=> LocationsRepository());
  locator.registerLazySingleton(() => AmenitiesRepository());
  locator.registerLazySingleton(() => UserRepository());
  locator.registerLazySingleton(() => Passenger());

  locator.registerLazySingleton(()=> DropProvider());
  locator.registerLazySingleton(()=> BoardProvider());

  locator.registerSingleton(GlobalKey<ScaffoldState>());
  
}