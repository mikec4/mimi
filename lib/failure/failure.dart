import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String failure;
  final String code;
  final String errorDetails;
  Failure({this.failure,this.code,this.errorDetails});

  @override 
  List<Object> get props => [failure,code,errorDetails];
  
}