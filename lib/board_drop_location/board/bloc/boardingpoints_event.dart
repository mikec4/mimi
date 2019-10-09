import 'package:equatable/equatable.dart';

abstract class BoardingpointsEvent extends Equatable {
  BoardingpointsEvent();
}

class FetchAllBoardingPointsEvent extends BoardingpointsEvent{

  final String busId;
  
  FetchAllBoardingPointsEvent({this.busId});

  List<Object> get props => [busId];
}
