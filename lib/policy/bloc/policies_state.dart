import 'package:equatable/equatable.dart';

abstract class PoliciesState extends Equatable {
 PoliciesState();
}

class LoadingPoliciesState extends PoliciesState {
 @override
  List<Object> get props => [];
}

class FetchAllPoliciesState extends PoliciesState{
  final List<dynamic> polices;
  FetchAllPoliciesState({this.polices});

  @override 
  List<Object> get props => [polices];
}

class ErrorPoliciesState extends PoliciesState{
  final dynamic error;
  ErrorPoliciesState({this.error});

  @override 
  List<Object> get props => [error];
}