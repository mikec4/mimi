import 'package:mimi/searchResult/searchModel/search_bus.dart';

class FilterModel {

  
  //Filter by names only
  List<SearchBus> filterNames(List<SearchBus> buses,List<String> names){
    
    List<SearchBus> _result = [];

   // if(names.length > 0 && departureTimes.length == 0){}

    for (var searchBus in buses){
      if(names.contains(searchBus.name)){
        _result.add(searchBus);
      }
    }

    return _result;
  }

  // Filter by Time

  List<SearchBus> filterDepartureTimes(List<SearchBus> buses,List<String> times){
    List<SearchBus> _result = [];

    for (var searchBus in buses){
      if(times.contains(searchBus.name)){
        _result.add(searchBus);
      }
    }

    return _result;
  }

  // Filter by travel names and departure times

  List<SearchBus> filterByDepartureTimeAndTravelNames(List<SearchBus> buses,List<String> times, List<String> names){
    List<SearchBus> _results = [];

    buses.forEach((bus){
      if(names.contains(bus.name) && times.contains(bus.departureTime)){
        _results.add(bus);
      }
    });

    assert(_results.length != 0);

    return _results;
  }

}