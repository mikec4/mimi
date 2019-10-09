import 'package:cloud_firestore/cloud_firestore.dart';

class PoliciesRepository{

  Future<DocumentSnapshot> getPolicies(String busId) async{
    var _reference =await Firestore.instance.collection('Policies').document(busId).get();
    return _reference;
  }

}