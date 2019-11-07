import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mimi/features/domain/entities/buses/buses..dart';

import 'bus_model.dart';

class BusModels extends Buses {
  
 final List<BusModel> busModels;

 BusModels({this.busModels}); 

 factory BusModels.fromDocumentSnapshots(List<DocumentSnapshot> snapshots){

  final busModels = snapshots.map((documentSnapshot) => BusModel.fromSnapshot(documentSnapshot)).toList();
  
  return BusModels(
    busModels:  busModels
  );
 }  
}