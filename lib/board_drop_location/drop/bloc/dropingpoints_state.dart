import 'package:equatable/equatable.dart';

abstract class DropingpointsState extends Equatable {
  DropingpointsState();
}

class LoadingDropingpointsState extends DropingpointsState {
  @override
  List<Object> get props => [];
}

class FetchAllDropingPointsState extends DropingpointsState{

  final List<dynamic> items;
  FetchAllDropingPointsState({this.items});
  
  @override
  List<Object> get props => [];
}

class ErrorDropingPointsState extends DropingpointsState{
  final dynamic error;
  ErrorDropingPointsState({this.error});

  @override 
  List<Object> get props => [];
  
}