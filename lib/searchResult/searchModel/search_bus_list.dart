import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:mimi/searchResult/searchModel/search_bus.dart';

class SearchBusList extends Equatable{
  List<SearchBus> buses;

  SearchBusList({this.buses}) : super([buses]);

  static SearchBusList fromSnapshots(List<DocumentSnapshot> snapshots){
    final result = snapshots.map((snapshot){

       return SearchBus.fromSnapshot(snapshot);
    }).toList();
    return SearchBusList(
      buses: result
    );
  }
}