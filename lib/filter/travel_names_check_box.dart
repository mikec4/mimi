import 'package:flutter/material.dart';
import 'package:mimi/searchResult/filter/filterProvider/filter_controller.dart';
import 'package:provider/provider.dart';

class TravelNamesCheckBox extends StatelessWidget {
  final String title;
  final int id;

  const TravelNamesCheckBox({Key key, this.title, this.id}) : super(key: key);


  @override
  Widget build(BuildContext context) {

      

    return Consumer<FilterController>(
      builder: (context, controller, _){
        
        print('TRAVEL TIMES ARE ${controller.travelNames.length}');

        return CheckboxListTile(
          title: Text(title),
          value: controller.travelNames.contains(title),
          onChanged: (value){

            if(controller.travelNames.contains(title)){
              controller.removeTravelNames(title);

            }else{
            controller.addTravelNames(title);
            }

          },
        );
      },
    );
  }
}