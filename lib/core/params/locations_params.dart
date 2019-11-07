import 'package:mimi/core/params/params.dart';

class LocationsParams extends Params{
  final String busId;
  final String locationType;

  LocationsParams({this.busId, this.locationType});

  @override 
  List<Object> get props => [busId,locationType];
  
}