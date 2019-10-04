
import 'package:flutter/material.dart';
import 'package:mimi/board_drop_location/drop/drop_radio_button.dart';

class DropLocation extends StatelessWidget {
  
  final  List<String> _drops = ['Kahama Stand','Isaka Stand'];

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: ListView.separated(
        separatorBuilder: (context,i) => Container(height: 0.5,color: Colors.black,),
        itemCount: _drops.length,
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

    return  Row(

      children: <Widget>[
        DropRadioButton(radioValue: _drops[index],),
        Text(_drops[index]),
      ],
    );
  }

  
  
}
