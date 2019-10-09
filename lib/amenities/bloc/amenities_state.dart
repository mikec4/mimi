import 'package:equatable/equatable.dart';

abstract class AmenitiesState extends Equatable {
 AmenitiesState();
}

class LoadingAmenitiesState extends AmenitiesState {
 @override
 List<Object> get props => [];
}

class FetchAllAmenitiesState extends AmenitiesState{

  final List<dynamic> items;
  FetchAllAmenitiesState({this.items});

  @override
  List<Object> get props => [items];

}

class ErrorAmenitiesState extends AmenitiesState{
  final String error;
  
  ErrorAmenitiesState({this.error});
  @override
  List<Object> get props => [error];
}


