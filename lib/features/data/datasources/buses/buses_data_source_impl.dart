import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:mimi/core/exceptions/exceptions.dart';
import 'package:mimi/features/data/datasources/buses/buses_data_source.dart';
import 'package:mimi/features/data/models/busmodels/bus_models.dart';

class BusesDataSourceImpl implements BusesDataSource{

  final Firestore firestore;

  BusesDataSourceImpl({this.firestore}) : assert(firestore != null);

  @override
  Future<BusModels> getAllBuses(Map<String, dynamic> routes, DateTime dateTime) async{

    try {
      QuerySnapshot querySnapshot = await Firestore.instance.collection('Bus')
                                   .where('Route',isEqualTo: routes)
                                   .where('DepartureDate',isEqualTo: dateTime)
                                   .getDocuments();

      var busModels = BusModels.fromDocumentSnapshots(querySnapshot.documents);

      return busModels;

    }  on PlatformException catch (_) {
      
      throw ServerExceptions();
    }
  }

  
}