import 'package:equatable/equatable.dart';
import 'package:mimi/features/domain/entities/buses/bus.dart';

class Buses extends Equatable{

  final List<Bus> buses;

  Buses({this.buses});

  @override 
  List<Object> get props => [buses];

}