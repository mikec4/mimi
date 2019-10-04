import 'package:mimi/passenger/model/passenger.dart';
import 'package:mimi/searchResult/searchModel/search_bus.dart';

class PaymentEntity{

  final List<Passenger> passengers;
  final SearchBus selectedBus;

  PaymentEntity({this.passengers,this.selectedBus});

  List<Passenger> convertPassenger(){

    List<Passenger> _passengers = [];

    for(var p in passengers){
      p.setRoute = selectedBus.route;
      p.setBusId = selectedBus.id;
      p.setFare = selectedBus.fare;
      p.setDepartureTime = selectedBus.departureTime;
      p.setArrivalTime = selectedBus.arriveTime;

      _passengers.add(p); 
    }
    return _passengers;
  }
}