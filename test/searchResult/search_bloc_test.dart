import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/searchResult/bloc/bloc.dart';
import 'package:mimi/searchResult/searchModel/search_bus_list.dart';
import 'package:mimi/searchResult/searchRepository/search_repository_impl.dart';
import 'package:mockito/mockito.dart';


class MockSearchRepository extends Mock implements SearchRepositoryImpl{}
class MockSearchBloc extends Mock implements SearchBloc{}

void main(){

   SearchBloc searchBloc;
   MockSearchRepository mockSearchRepository;
   MockSearchBloc mockSearchBloc;

   setUp(() async{

    mockSearchRepository = MockSearchRepository();
    mockSearchBloc = MockSearchBloc();
    searchBloc = SearchBloc(searchRepositoryImpl: mockSearchRepository);

   });

   tearDown((){
     searchBloc?.close();
   });

  group('Searchblocs', (){

    final routes = {"From": "","To":""};
    final dateTime = DateTime.now();
    final buses  = SearchBusList();
    final failure = Failure(failure: 'Failed data');
    

     test('Emits initialstate', (){
      expect(searchBloc.initialState, equals(LoadSearchState()));
    });
    
    test('Does not emit stream when bloc closes', () {
      expectLater(searchBloc,emitsInOrder([LoadSearchState(),emitsDone]));
      searchBloc.close();
    });

    test('Emits [LoadSearchState,BusesSearchState]', () {

      final response = [LoadSearchState(),BusesSearchState(searchBusList: buses)];

      when(mockSearchRepository.queryAllBuses(routes, dateTime)).thenAnswer((_) async => Right(buses));

      expectLater(searchBloc, emitsInOrder(response));

      searchBloc.add(SearchByName(dateTime: dateTime,route: routes));

    });

    test('Emits [LoadSearchState,ErrorSearchState]', () {

      final response = [LoadSearchState(),ErrorSearchState(message: failure.failure)];

      when(mockSearchRepository.queryAllBuses(routes, dateTime)).thenAnswer((_) async => Left(failure));

      expectLater(searchBloc, emitsInOrder(response));

      searchBloc.add(SearchByName(dateTime: dateTime,route: routes));

    });

    
    
  });

}
