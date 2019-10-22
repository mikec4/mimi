import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String failure;
  Failure({this.failure});

  @override 
  List<Object> get props => [failure];
  
}