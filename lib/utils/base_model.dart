import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class BaseModel extends Equatable{
  List<dynamic> items;
  String busId;
  BaseModel({this.items,this.busId});
  
  List<Object> get props => [items,busId];

  static BaseModel fromFirebase(List<DocumentSnapshot> snapshots){
    return BaseModel(
      items: snapshots[0].data['Amenities']
    );
  }

  static BaseModel fromSnapshot(DocumentSnapshot snapshot,String type){
    return BaseModel(
      busId: snapshot.data['BusId'],
      items: snapshot.data[type]
    );
  }

  static BaseModel fromBoardPoints(DocumentSnapshot snapshot){
    return BaseModel(
      busId: snapshot.data['BusId'],
      items: snapshot.data['BoardingPoints']
    );
  }

   static BaseModel fromDropintPoints(DocumentSnapshot snapshot){
    return BaseModel(
      busId: snapshot.data['BusId'],
      items: snapshot.data['BoardingPoints']
    );
  }


}