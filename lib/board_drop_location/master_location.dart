 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mimi/board_drop_location/board_drop_location.dart';
import 'package:mimi/bus/busProvider/bus_controller.dart';
import 'package:mimi/passenger/pages/passenger_page.dart';
import 'package:mimi/passenger/passengerProvider/passenger_controller.dart';
import 'package:provider/provider.dart';

class MasterLocation extends StatefulWidget {

  @override
  _MasterLocationState createState() => _MasterLocationState();
}

class _MasterLocationState extends State<MasterLocation> {

  BusController _controller;
  PassengerController _passengerController;

  static const master_location = '/masterLocation';

 @override
  Widget build(BuildContext context) {
    _controller = Provider.of<BusController>(context);
    _passengerController = Provider.of<PassengerController>(context);

    return Scaffold(
      body: BoardDropLocation(),
      bottomNavigationBar: InkWell(
        onTap: _navigate,
        child: Container(
          child: Text('CONTINUE BOOKING',style: TextStyle(color: Colors.white),),
          height: 50.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color:Theme.of(context).primaryColor,
           // borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0),topRight:Radius.circular(5.0))
          ),
        ),
      ),
    );
  }

 
  void _navigate() async{
    
    Navigator.push(context, MaterialPageRoute(builder: (context) => PassengerPage()));
    //_controller.addInsurance();
    _passengerController.resetPassengerList();

  }

}



