import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mimi/policy/repository/policies_repository.dart';

class PoliciesRepositoryImpl extends PoliciesRepository{
  
  @override
  Future getPolicies(String busId) async{
    var _reference =await Firestore.instance.collection('Policies').document(busId).get();
    return _reference;
  }
}