import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mimi/passenger/model/passenger.dart';

class PaymentRepository {

  Future<String> makePayment(Passenger passenger) async{

    DocumentReference  documentReference = await Firestore.instance.
     collection('Passengers').add(_onPassengerMap(passenger));

    return documentReference.documentID;
   
  }


  Map<String,dynamic> _onPassengerMap(Passenger passenger){

    var _passenger = {
      "Name" : passenger.name,
      "BusId" : passenger.busId,
      "Mobile" : passenger.mobile,
      "Gender" : passenger.gender,
      "Fare" : passenger.fare,
        "Route" : passenger.route,
      "SeatNumber": passenger.seatNumber,
      "Date": {
        "Departure": passenger.departureDate,
        "Arrival" : passenger.arrivalDate
      },
      "Time":{
        "Departure" : passenger.departureTime,
        "Arrival" : passenger.arrivalTime
      },
    };
    return _passenger;
  }


}