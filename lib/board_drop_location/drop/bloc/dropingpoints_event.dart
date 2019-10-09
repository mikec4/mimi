import 'package:equatable/equatable.dart';

abstract class DropingpointsEvent extends Equatable {
  DropingpointsEvent();
}

class FetchAllDropingPointsEvent extends DropingpointsEvent{

  final String busId;
  FetchAllDropingPointsEvent({this.busId});
  
  @override
  List<Object> get props => [busId];
}
