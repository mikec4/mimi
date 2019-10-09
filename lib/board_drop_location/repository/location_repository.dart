import 'package:cloud_firestore/cloud_firestore.dart';

class LocationsRepository{


   Future<DocumentSnapshot> getBoardingPoints(String busId) async{
    var _reference =await Firestore.instance.collection('BoardingPoints').document(busId).get();

    return _reference;
  }
  
   Future<DocumentSnapshot> getDropingPoints(String busId) async{
    var _reference =await Firestore.instance.collection('DropingPoints').document(busId).get();
    return _reference;
  }

}