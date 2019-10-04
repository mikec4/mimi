
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BusRepository extends Equatable{
  final List<DocumentSnapshot> _documentSnapshots;
  List<Map<String, dynamic>> _busItems = List<Map<String,dynamic>>();

  BusRepository({List<DocumentSnapshot> documentSnapshots}):
  assert(documentSnapshots != null),
  _documentSnapshots = documentSnapshots;

  List<Map<String, dynamic>> busData(){
            print('Bus results ${_documentSnapshots[1].data}');

     for (var document in _documentSnapshots) {
         Map<String,dynamic> snaps =document.data;
         snaps.addAll({"ID": document.documentID});
        _busItems.add(snaps);
     }
    return _busItems;
  }

  

}