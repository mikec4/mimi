import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mimi/searchResult/searchModel/search_bus.dart';

@immutable
abstract class BusEvent extends Equatable {
  BusEvent([List props = const <dynamic>[]]) : super(props);
}

class CreateBusEvent extends BusEvent{

  final SearchBus selectedBus;

  CreateBusEvent({this.selectedBus}) : super([selectedBus]);


  @override
  String toString() {
    return 'Create Bus Event';
  }
}

class SelectSeatBusEvent extends BusEvent{
  
  final String selectedSeat;

  SelectSeatBusEvent({this.selectedSeat}) : super([selectedSeat]);

  @override
  String toString() {
    return 'Select seat bus event';
  }
}

class BusAmenitiesBusEvent extends BusEvent{
  final String busId;
  BusAmenitiesBusEvent({this.busId}) : super([]);
}