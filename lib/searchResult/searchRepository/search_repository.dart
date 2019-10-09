
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchRepository {
  

  Future<List<DocumentSnapshot>> fetchAll() async{

    QuerySnapshot querySnapshot =  await Firestore.instance.collection('Bus').getDocuments();
    return querySnapshot.documents;

  }

  Future<List<DocumentSnapshot>> getByQuery(Map<String,dynamic> route,DateTime dateTime) async{
    QuerySnapshot querySnapshot = await Firestore.instance.collection('Bus')
                                   .where('Route',isEqualTo: route)
                                   .where('DepartureDate',isEqualTo: dateTime)
                                   .getDocuments();
    
    return querySnapshot.documents;
  }


}