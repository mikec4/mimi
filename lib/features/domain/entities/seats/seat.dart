import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Seat extends Equatable{

  final String seatNumber;
  final String gender;

  Seat({@required this.seatNumber, @required this.gender});

  @override 
  List<Object> get props => [seatNumber,gender];

}