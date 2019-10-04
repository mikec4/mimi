import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mimi/searchResult/searchModel/search_bus_list.dart';

@immutable
abstract class SearchState extends Equatable {
  SearchState([List props = const <dynamic>[]]) : super(props);
}

class InitialSearchState extends SearchState {

}

class EmptySearchState extends SearchState{}

class LoadSearchState extends SearchState{
 
 @override
  String toString() {
    return 'Load Search State';

  }
}

class BusesSearchState extends SearchState{

  @override
  String toString() {
    return 'Buses Search State';
  }
  
  final SearchBusList searchBusList;

  BusesSearchState({this.searchBusList}) : super([searchBusList]);
  

}


class ErrorSearchState extends SearchState{

  final String message;

  ErrorSearchState({this.message}): super([message]);

}

