import 'package:equatable/equatable.dart';

abstract class PoliciesEvent extends Equatable {
  PoliciesEvent([List props = const <dynamic> []]) : super(props);
}

class FetchAllPoliciesEvent extends PoliciesEvent{
  final String busId;
  FetchAllPoliciesEvent({this.busId});

  @override 
  List<Object> get props => [busId];
}
