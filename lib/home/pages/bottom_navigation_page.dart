import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mimi/bookings/pages/bookings_page.dart';
import 'package:mimi/home/pages/account_page.dart';
import 'package:mimi/home/pages/help_page.dart';
import 'package:mimi/home/pages/home_page.dart';
import 'package:mimi/utils/size_config.dart';

class BottomNavigationPage extends StatefulWidget {

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {

  int _currentIndex = 0;
  
  PageController _pageController = PageController();


  var _items = [
    BottomNavyBarItem(
      icon: Icon(MdiIcons.home),
      title: Text('Home'),
      activeColor: Colors.purple,
      inactiveColor: Colors.grey

    ),

    BottomNavyBarItem(
      icon: Icon(MdiIcons.ticketOutline),
      title: Text('Bookings'),
      activeColor: Colors.purple,
      inactiveColor: Colors.grey
    ),
    BottomNavyBarItem(
      icon: Icon(Icons.headset_mic),
      title: Text('Help Center'),
      activeColor: Colors.purple,
      inactiveColor: Colors.grey
    ),
    BottomNavyBarItem(
      icon: Icon(Icons.person_outline),
      title: Text('Account'),
      activeColor: Colors.purple,
      inactiveColor: Colors.grey
    ),
  ];

  var _pages = [
    HomePage(),
    BookingsPage(),
    HelpPage(),
    AccountPage(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // body: _pages[_currentIndex],
      body:PageView.builder(
        onPageChanged: (i){
          setState(() {
           _currentIndex = i; 
          });
        },
        itemBuilder: (context,i) => _pages[i],
        itemCount: _pages.length,
        pageSnapping: true,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavyBar(
        iconSize: SizeConfig.blockHorizontalSize * 6.94,
        items: _items,
        selectedIndex: _currentIndex,
        animationDuration: Duration(milliseconds: 300),
        showElevation: true,
        onItemSelected: (i) async{
          setState(() {
           _currentIndex = i; 
           _pageController.animateToPage(i,duration: Duration(milliseconds: 300),curve: Curves.decelerate);
          });

        },
      ),
    );
  }
}
