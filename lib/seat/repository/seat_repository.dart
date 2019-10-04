
import 'package:cloud_firestore/cloud_firestore.dart';

class SeatRepository {

  Future<List<DocumentSnapshot>> getAllSeats(String id) async {

    QuerySnapshot querySnapshot = await Firestore.instance.collection('Passengers').where('BusId',isEqualTo: id).getDocuments();
    
    return querySnapshot.documents;
  }

  
}