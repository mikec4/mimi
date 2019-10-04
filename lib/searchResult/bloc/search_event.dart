import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent extends Equatable {
  SearchEvent([List props = const <dynamic>[]]) : super(props);
}

class GetAllSearchEvent extends SearchEvent{
  
  @override
  String  toString() => 'Get all buses';
  
}

class SearchByName extends SearchEvent{

  final Map<String,dynamic> route;
  
  final DateTime dateTime;
  
  SearchByName({this.route,this.dateTime}) : super([route,dateTime]);
  
  @override
  String toString() => 'Search by name event';
  
}
