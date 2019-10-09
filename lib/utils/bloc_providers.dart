
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/amenities/bloc/amenities_bloc.dart';
import 'package:mimi/board_drop_location/board/bloc/boardingpoints_bloc.dart';
import 'package:mimi/board_drop_location/drop/bloc/dropingpoints_bloc.dart';
import 'package:mimi/bus/bloc/bloc.dart';
import 'package:mimi/payment/bloc/bloc.dart';
import 'package:mimi/policy/bloc/policies_bloc.dart';
import 'package:mimi/searchResult/bloc/bloc.dart';
import 'package:mimi/seat/bloc/seat_bloc.dart';

List<BlocProvider> blocProviders = [
  
  BlocProvider<PoliciesBloc>(
    builder: (_) => PoliciesBloc(),
  ),

  BlocProvider<BoardingpointsBloc>(
    builder: (_) => BoardingpointsBloc(),
  ),
  BlocProvider<DropingpointsBloc>(
    builder: (BuildContext context) => DropingpointsBloc(),
  ),
  

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
  ),
  BlocProvider<AmenitiesBloc>(
    builder: (_) => AmenitiesBloc(),
  )


];