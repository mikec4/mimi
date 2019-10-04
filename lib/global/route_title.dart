import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mimi/home/homeProvider/home_provider.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';

class RoutesTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_,model,child){
        return Row(
          children: <Widget>[
            Text('${model.originalLocation}',),
            SizedBox(width: SizeConfig.blockHorizontalSize * 2.78,),
            Icon(MdiIcons.swapHorizontal,size: SizeConfig.blockHorizontalSize * 5.56,color: Colors.white,),
            SizedBox(width: SizeConfig.blockHorizontalSize * 2.78 ,),
            Text('${model.destination}',style: TextStyle(fontSize: SizeConfig.blockHorizontalSize * 4.17),)
          ],
        );
      },
    );
  }
}