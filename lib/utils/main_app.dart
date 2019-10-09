import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/authenticate/bloc/authentication_bloc.dart';
import 'package:mimi/authenticate/bloc/bloc.dart';
import 'package:mimi/home/homeProvider/home_provider.dart';
import 'package:mimi/land/main_home_page.dart';
import 'package:mimi/login/pages/login_page.dart';
import 'package:mimi/login/pages/splash_page.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:mimi/utils/theme.dart';
import 'package:provider/provider.dart';

import '../providers.dart';
import 'bloc_providers.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig().init(constraints);

        return ChangeNotifierProvider<HomeProvider>(
          builder: (context) => HomeProvider(),
          child: MultiBlocProvider(
            providers: blocProviders,
            child: MultiProvider(
              providers: providers,
                child: MaterialApp(
                //navigatorObservers: [CustomRouteObserver()],
                debugShowCheckedModeBanner: false,
                theme: themeData,
                home: HomeAuth()
              ),
            ),
          ),
        );
      }
    );
  }
}


class HomeAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc,AuthenticationState>(
      builder: (context,state) {

        if(state is InitialAuthenticationState){
          return SplashPage();
          }
        else if (state is AuthenticatedWithEmail || state is AuthenticatedWithMobileNumber){
          return MainHomePage();
        }
        else if(state is Unauthenticated){
          return LoginPage();
        }
                  
      },
    );
  }
}

