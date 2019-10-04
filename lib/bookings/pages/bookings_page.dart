import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mimi/bookings/pages/booked_ticket.dart';
import 'package:mimi/bookings/pages/cancelled_ticket.dart';
import 'package:provider/provider.dart';

class BookingsPage extends StatefulWidget {
  @override
  _BookingsPageState createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  List<String> _tabs = ['BOOKED','CANCELLED'];

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
    return Scaffold(
      appBar: AppBar(title: Text('Bookings'),),
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
                tabs: _tabs.map((tab) => Tab(text: tab,)).toList()
              ),
              ConstrainedBox(
                constraints: constrains,
                child: Container(
                  height: constrains.maxHeight - 60.0,
                  child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    BookedTicket(),
                    CancelledTicket()
                  ],
              ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}