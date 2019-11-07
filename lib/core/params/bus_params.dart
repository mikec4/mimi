import 'package:mimi/core/params/params.dart';

class BusParams extends Params{

  final Map<String,dynamic> route;
  final DateTime departureDate;
  final String busId;

  BusParams({this.route, this.departureDate,this.busId});

  @override
  List<Object> get props => [route,departureDate,busId];
  
}