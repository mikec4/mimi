import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mimi/board_drop_location/board/board_location.dart';
import 'package:mimi/board_drop_location/drop/drop_location.dart';
import 'package:mimi/global/route_title.dart';
import 'package:mimi/utils/size_config.dart';

class BoardDropLocation extends StatefulWidget {
  @override
  _BoardDropLocationState createState() => _BoardDropLocationState();
}

class _BoardDropLocationState extends State<BoardDropLocation> with SingleTickerProviderStateMixin {
  
  List<String> _tabs = ['BOARDING','DROPPING'];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this,length: 2);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return _location();
   
  }

  Widget _location(){
    return Scaffold(
      appBar: AppBar(
        title: RoutesTitle(),
      ),
      body: LayoutBuilder(
        builder: (context,constrains){
          
          return Column(
            children: <Widget>[
              SizedBox(height: 10,),
              TabBar(
                labelColor: Theme.of(context).tabBarTheme.labelColor,
                labelStyle: Theme.of(context).textTheme.subtitle,
                unselectedLabelColor: Theme.of(context).tabBarTheme.unselectedLabelColor,
                unselectedLabelStyle: Theme.of(context).textTheme.subtitle,
                indicatorWeight: 4,
                dragStartBehavior: DragStartBehavior.start,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.only(left: 5.0,right: 5.0),
               controller: _tabController,
                tabs: _tabs.map((tab) => Tab(text: tab,)).toList(),
              ),
              ConstrainedBox(
                constraints: constrains,
                child: Container(
                  height: constrains.maxHeight - SizeConfig.blockVerticalSize * 8.11,
                  child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    BoardLocation(),
                    DropLocation()
                  ],
              ),
                ),
              )
            ],
          );
        },
      )
    );
  
  }

}