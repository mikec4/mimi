import 'package:equatable/equatable.dart';

class Locations extends Equatable{
  
  final List<dynamic> locations;

  Locations({this.locations});

  @override 
  List<Object> get props => [locations];

}