import 'package:flutter/material.dart';

class BusPolicy extends StatefulWidget {
  @override
  _BusPolicyState createState() => _BusPolicyState();
}

class _BusPolicyState extends State<BusPolicy>with TickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2,initialIndex: 0,vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}