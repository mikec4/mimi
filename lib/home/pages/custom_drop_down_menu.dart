import 'package:flutter/material.dart';
import 'package:mimi/home/homeProvider/home_provider.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';


class CustomDropDownMenu extends StatelessWidget {
  
  final List<String> routes;
  final String label;

  const CustomDropDownMenu({Key key, this.routes, this.label}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    var _homeProvider = Provider.of<HomeProvider>(context);

    return Container(
            padding: EdgeInsets.only(
              top: SizeConfig.blockVerticalSize * 2.03,
            left: SizeConfig.blockHorizontalSize * 4.17,
            right: SizeConfig.blockHorizontalSize * 4.17
            ),
            //height: SizeConfig.blockVerticalSize * 12.16,
            child: DropdownButtonFormField(
            
              value: label.contains('From') ?  _homeProvider.originalLocation : _homeProvider.destination,
              onSaved: (value) async{

                if(label.contains('From')){

                _homeProvider.setOriginalLocation(value);

                }
                if(label.contains('Destination')){
                  _homeProvider.setDestination(value);
                }
              },

              onChanged: (value) async{
                if(label.contains('From')){

                _homeProvider.setOriginalLocation(value);

                }
                if(label.contains('Destination')){
                  _homeProvider.setDestination(value);
                }
              },
             
              items: routes.map((value) => DropdownMenuItem(
                value: value,
                child: Text(value,style: TextStyle(color: Colors.black)),
              )).toList(),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.purple),
                labelText: label,
                prefixIcon: Icon(Icons.location_on),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.purple
                  )
                )
              ),
            ),
  );

  }
}

