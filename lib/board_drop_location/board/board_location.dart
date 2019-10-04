import 'package:flutter/material.dart';
import 'package:mimi/board_drop_location/board/board_radio_button.dart';

class BoardLocation extends StatelessWidget {
  final TabController tabController;

  BoardLocation({this.tabController});
  
  final List<String> _boarding =[
    'Ubungo Bus stand',
    'Kimara Stop Over',
    'Mbezi Bus stand',
    'Kibaha Stand',
    'Chalinze Bus Stand'
  ];



  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (context,i) => Container(height: 0.5,color: Colors.black,),
        itemCount: _boarding.length,
        itemBuilder: (context,i) =>
         Column(
           children: <Widget>[
             _radioRow(i),
            // _customDivider()
           ],
         ),
      ),
    );
    
  }
 
 Widget _radioRow(int index){
   
   return Row(

    children: <Widget>[
      BoardRadioButton(
      radioValue: _boarding[index],),
      Text(_boarding[index]),
    
    ],
  );
 }
 
}

