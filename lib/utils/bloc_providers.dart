
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/bus/bloc/bloc.dart';
import 'package:mimi/login/bloc/login_bloc.dart';
import 'package:mimi/payment/bloc/bloc.dart';
import 'package:mimi/searchResult/bloc/bloc.dart';
import 'package:mimi/seat/bloc/seat_bloc.dart';

List<BlocProvider> blocProviders = [

 

  BlocProvider<BusBloc>(
    builder: (BuildContext context) => BusBloc(),
  ),

  BlocProvider<SearchBloc> (
    builder: (BuildContext context) => SearchBloc(),
  ),

  BlocProvider<PaymentBloc>(
    builder: (_) => PaymentBloc(),
  ),

  BlocProvider<SeatBloc>(
    builder: (_) => SeatBloc(),
  )


];