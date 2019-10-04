
import 'package:flutter/material.dart';
import 'package:mimi/policy/busFacility.dart';
import 'package:mimi/policy/busPolicy.dart';
import 'package:mimi/policy/busReviews.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PolicyPanel extends StatefulWidget {
  final PanelController panelController;
  PolicyPanel({this.panelController});
  @override
  _PolicyPanelState createState() => _PolicyPanelState();
}

class _PolicyPanelState extends State<PolicyPanel>with SingleTickerProviderStateMixin {
  TabController _tabController;

  PanelController get panelController => widget.panelController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3,vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width,50.0),
              child: TabBar(
                labelColor: Theme.of(context).primaryColor,
                labelStyle: Theme.of(context).textTheme.subtitle,
                unselectedLabelStyle: Theme.of(context).textTheme.subtitle,
                unselectedLabelColor: Theme.of(context).accentColor,
                indicatorColor: Theme.of(context).primaryColor,
                indicatorPadding: EdgeInsets.only(left: 10.0,right: 10.0),
                isScrollable:false,
                onTap: (i) =>panelController.open(),
                indicatorWeight: 3.5,
                indicatorSize: TabBarIndicatorSize.tab,
                controller: _tabController,
                tabs: <Widget>[
                  Tab(text: 'FACILITIES'),
                  Tab(text: 'POLICIES',),
                  Tab(text: 'REVIEWS',)
                ],
              ),
              
            ),

            body: TabBarView(

              physics: AlwaysScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                BusFacility(),
                BusPolicy(),
                BusReviews()
              ],
            ),
    );
  }


}