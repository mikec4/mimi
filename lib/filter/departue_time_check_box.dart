import 'package:flutter/material.dart';
import 'package:mimi/searchResult/filter/filterProvider/filter_controller.dart';
import 'package:provider/provider.dart';

class DepartureTimeCheckBox extends StatelessWidget {
  final String title;

  const DepartureTimeCheckBox({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<FilterController>(
      builder: (context,controller, _){
        return CheckboxListTile(
          title: Text(title),
          value: controller.departureTimes.contains(title),
          onChanged: (value){
            if(controller.departureTimes.contains(title)){
              controller.removeDepartureTimes = title;
            }else {
              controller.setDepartureTimes = title;
            }
          },
        );
      },
    );
  }
}