import 'package:equatable/equatable.dart';
import 'package:mimi/features/domain/entities/seats/seat.dart';

class Seats extends Equatable{
  
  final List<Seat> seats;

  Seats({this.seats});

  @override 
  List<Object> get props => [seats];

}