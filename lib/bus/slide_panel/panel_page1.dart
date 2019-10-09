
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/amenities/amenities_page.dart';
import 'package:mimi/amenities/bloc/bloc.dart';
import 'package:mimi/board_drop_location/drop/drop_location.dart';
import 'package:mimi/bus/bloc/bloc.dart';
import 'package:mimi/bus/busProvider/bus_controller.dart';
import 'package:mimi/policy/policy_page.dart';
import 'package:mimi/reviews/reviews_page.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';




class PanelPage1 extends StatefulWidget {
  final PanelController panelController;

  const PanelPage1({Key key, this.panelController}) : super(key: key);


  @override
  _PanelPage1State createState() => _PanelPage1State();
}

class _PanelPage1State extends State<PanelPage1> with TickerProviderStateMixin{

  TabController _tabController;

  List<String> _tabs = ['AMENITIES','POLICY','REVIEWS'];
  
  BusController _busController;
  PageController _pageController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this,length: 3,initialIndex: 0);
    _pageController = PageController();

  }

  @override
  void dispose() {
    _tabController.dispose();
    widget.panelController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _busController = Provider.of<BusController>(context);

    return Scaffold(
      appBar: PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width,SizeConfig.blockVerticalSize * 7.895),
    child: TabBar(
      labelColor: Theme.of(context).tabBarTheme.labelColor,
      labelStyle: Theme.of(context).textTheme.subtitle,
      unselectedLabelStyle: Theme.of(context).textTheme.subtitle,
      unselectedLabelColor: Theme.of(context).tabBarTheme.unselectedLabelColor,
      indicatorColor: Theme.of(context).primaryColor,
      indicatorPadding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHorizontalSize * 2.8),
      onTap: (i) => i == 0 ? widget.panelController.open() : null,
      indicatorWeight: SizeConfig.blockHorizontalSize * 1.1111,
      controller: _tabController,
      
      tabs: _tabs.map((value) => Tab(text: value,)).toList(),
    )

    ),
    body: TabBarView(
    physics: AlwaysScrollableScrollPhysics(),
    controller: _tabController,
    children: <Widget>[
     // BusPhotos(),
      MainAmenitiesPage(),
      MainPoliciesPage(),
      ReviewsPage()
    ],
    
    ),
   
    );
   
  }
}