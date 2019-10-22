import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SeatEvent extends Equatable {
  SeatEvent([List props = const <dynamic>[]]) : super(props);
}

class FetchAllSeatEvent extends SeatEvent{
  
  final String busId;
  
  FetchAllSeatEvent({this.busId}) : super([busId]);

  @override
  String toString() {
    return 'Get all seat event';
  }
}
