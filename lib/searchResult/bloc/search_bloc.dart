import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/searchResult/searchRepository/search_repository_impl.dart';
import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  SearchRepositoryImpl _searchRepository;
  
  SearchBloc({SearchRepositoryImpl searchRepositoryImpl}) : 
  _searchRepository = searchRepositoryImpl ?? SearchRepositoryImpl();


  @override
  SearchState get initialState => LoadSearchState();

  


  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {

    if(event is SearchByName){

        yield LoadSearchState();

      // try {

      //   final snapshots = await _searchRepository.getByQuery(event.route,event.dateTime);
      //   final buses = SearchBusList.fromSnapshots(snapshots);
      //   yield BusesSearchState(searchBusList: buses);

      // } catch (error) {

      //   yield error is ErrorSearchState ? ErrorSearchState(message: error.message) : 'Not a common error';

      //   }

        var result = await _searchRepository.queryAllBuses(event.route, event.dateTime);

        yield* result.fold((failure) async*{
          //yield LoadSearchState();
          yield ErrorSearchState(message: failure.failure);

        }, (searchBusList) async*{
          //yield LoadSearchState();
          yield BusesSearchState(searchBusList: searchBusList);
        });
      }
  }
}
