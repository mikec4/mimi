import 'package:equatable/equatable.dart';

abstract class BoardingpointsState extends Equatable {
  BoardingpointsState();
}

class LoadingBoardingpointsState extends BoardingpointsState {
  @override
  List<Object> get props => [];
}

class FetchAllBoardingPointsState extends BoardingpointsState{

  List<dynamic> boardingPoints;

  FetchAllBoardingPointsState({this.boardingPoints});

  @override
  List<Object> get props => [boardingPoints];


}

class ErrorBoardingPointsState extends BoardingpointsState{
  final dynamic error;
  ErrorBoardingPointsState({this.error});

  @override 
  List<Object> get props => [error];
}
