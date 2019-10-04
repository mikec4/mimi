import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/searchResult/searchModel/search_bus_list.dart';
import 'package:mimi/searchResult/searchRepository/search_repository.dart';
import 'package:rxdart/rxdart.dart';
import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  final SearchRepository _searchRepository = SearchRepository();

  @override
  SearchState get initialState => InitialSearchState();

  


  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {

    if(event is SearchByName){

       yield LoadSearchState();

      try {

        final snapshots = await _searchRepository.getByQuery(event.route,event.dateTime);
        final buses = SearchBusList.fromSnapshots(snapshots);
        yield BusesSearchState(searchBusList: buses);

      } catch (error) {

        yield error is ErrorSearchState ? ErrorSearchState(message: error.message) : 'Not a common error';

        }
      }
  }
}
