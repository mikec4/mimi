import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mimi/seat/model/seat.dart';

@immutable
abstract class SeatState extends Equatable {
  SeatState([List props = const <dynamic>[]]) : super(props);
}

class InitialSeatState extends SeatState {}

class LoadSeatState extends SeatState{
  @override
  String toString() {
    return 'Load seat state';
  }
}

class ListSeatState extends SeatState{
  
  final List<Seat> seats;

  ListSeatState({this.seats}) : super([seats]);

  @override
  String toString() {
    return 'List Seat State';
  }
}

class ErrorSeatState extends SeatState{

  final String message;

  ErrorSeatState({this.message}) : super([message]);

  @override
  String toString() {
    // TODO: implement toString
    return 'Error seat state';
  }


}