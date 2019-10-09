import 'package:equatable/equatable.dart';

abstract class AmenitiesEvent extends Equatable {
  //AmenitiesEvent([List props = const <dynamic> []]) : super(props);
  AmenitiesEvent();
}

class FetchAllAmenitiesEvent extends AmenitiesEvent{
  final String busId;

  FetchAllAmenitiesEvent({this.busId});
  
  @override
  List<Object> get props => [busId];

}
