import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mimi/searchResult/searchModel/search_bus.dart';

@immutable
abstract class BusState extends Equatable {
  BusState([List props = const <dynamic>[]]) : super(props);
}

class InitialBusState extends BusState {}


class LoadBusState extends BusState{

  @override
  String toString() {
    return 'Load Bus State';
  }


}

class GetSelectedBusState extends BusState{

  final SearchBus selectedBus;

  GetSelectedBusState({this.selectedBus}): super([selectedBus]);

  @override
  String toString() {
    return 'Get selected bus state';
  }

}

class GetSelectedSeatBusState extends BusState{

  final List<String> selectedSeats;

  GetSelectedSeatBusState({this.selectedSeats}) : super([selectedSeats]);

  @override
  String toString() {
    return 'Get selected seat bus state';
  }
}

class ErrorBusState extends BusState{

  final String message;

  ErrorBusState({this.message}) : super([message]);

  @override
  String toString() {
    return 'Error bus state ';
  }
}