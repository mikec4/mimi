import 'package:mimi/features/data/models/busmodels/bus_models.dart';

abstract class BusesDataSource{
  
  Future<BusModels> getAllBuses(Map<String,dynamic> routes,DateTime dateTime);

}