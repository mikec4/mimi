import 'package:cloud_firestore/cloud_firestore.dart';

class AmenitiesRepository{
  
  Future<List<DocumentSnapshot>> getAllAmenities(String id) async {

    QuerySnapshot querySnapshot = await Firestore.instance.collection('Amenities').
     where('BusId',isEqualTo:id).getDocuments();
    
    return querySnapshot.documents;
  }
  
  Future<DocumentSnapshot> getAmenities(String busId) async{
    var _reference =await Firestore.instance.collection('Amenities').document(busId).get();
    return _reference;
  }



}