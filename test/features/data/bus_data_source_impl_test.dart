
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mimi/features/data/datasources/buses/buses_data_source_impl.dart';
import 'package:mimi/features/data/models/busmodels/bus_models.dart';
import 'package:mockito/mockito.dart';

class MockFirestore extends Mock implements Firestore{}

void main(){

  MockFirestore mockFirestore;
  BusesDataSourceImpl dataSource;

  setUp((){
    mockFirestore = MockFirestore();
    dataSource = BusesDataSourceImpl(firestore: mockFirestore);

  });

  group('Buses data sources', (){
    final Map<String,dynamic> tRoutes = {};
    final tDate = DateTime.now();
    final tBusModels = BusModels();

    test('Get all buse models', () {
      //when(mockFirestore.)
    });
  });
}