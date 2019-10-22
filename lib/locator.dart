
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mimi/amenities/repository/amenities_repository_impl.dart';
import 'package:mimi/board_drop_location/repository/location_repository_impl.dart';
import 'package:mimi/login/loginRepository/user_repository_impl.dart';
import 'package:mimi/policy/repository/policieis_repository_impl.dart';
import 'package:mimi/policy/repository/policies_repository.dart';
import 'package:mimi/seat/repository/seat_repository.dart';

import 'board_drop_location/board/board_provider.dart';
import 'board_drop_location/drop/drop_provider.dart';
import 'passenger/model/passenger.dart';
import 'searchResult/searchRepository/search_repository.dart';
import 'searchResult/searchRepository/search_repository_impl.dart';
import 'seat/repository/seat_repository_impl.dart';

GetIt locator = GetIt();

Future<void> setupLocator() async{
  locator.allowReassignment = true;
  
  locator.registerLazySingleton(() => GlobalKey<FormState>());
  locator.registerSingleton(GlobalKey<ScaffoldState>());

  locator.registerSingleton(ScrollController());
  locator.registerSingleton(FocusScopeNode());
  
  locator.registerLazySingleton(()=> GoogleSignIn());
  locator.registerLazySingleton(()=> FacebookLogin());
  locator.registerLazySingleton(()=> FirebaseAuth.instance);
  
  locator.registerLazySingleton<SeatRepository>(() => SeatRepositoryImpl());
  locator.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl());
  locator.registerLazySingleton<PoliciesRepository>(() => PoliciesRepositoryImpl());
  locator.registerLazySingleton(()=> LocationRepositoryImpl());
  locator.registerLazySingleton(() => AmenitiesRepositoryImpl());
  locator.registerLazySingleton(() => UserRepositoryImpl());
  
  locator.registerLazySingleton(() => Passenger());

  locator.registerLazySingleton(()=> DropProvider());
  locator.registerLazySingleton(()=> BoardProvider());

  
}