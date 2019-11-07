import 'package:equatable/equatable.dart';
import 'package:mimi/utils/base_model.dart';

class BaseModelList extends Equatable {
  
  List<BaseModel> baseModels;
  
  BaseModelList({this.baseModels});

  @override
  List<Object> get props => [baseModels];

  // static BaseModelList fromSnapshots(List<DocumentSnapshot> snapshots){
  //   var _baseModeList = snapshots.map((snapshot){
  //     return BaseModel.fromSnapshot(snapshot);
  //   }).toList();

  //   return BaseModelList(
  //     baseModels: _baseModeList
  //   );
    
  // }
}