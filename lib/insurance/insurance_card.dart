import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mimi/bus/busProvider/bus_controller.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';

class InsuranceCard extends StatefulWidget {
  @override
  _InsuranceCardState createState() => _InsuranceCardState();
}

class _InsuranceCardState extends State<InsuranceCard> {

  BusController _busController;
  
  @override
  Widget build(BuildContext context) => _buildBody();

  Widget _buildBody(){

    _busController = Provider.of<BusController>(context);

    return Card(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.44,
          child: Column(
            children: <Widget>[
              _header(),
              _body(),
              _yesRow(),
              _noRow()
            ],
          ),
        ),
      );
  }

  

  Widget _header(){
    return Container(
      alignment: Alignment(-0.5,0.0),
      color: Colors.orangeAccent,
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width,
      child: Text('Pay TZs 5000 per passenger to insure your travel',style: TextStyle(color: Colors.white,fontFamily: 'NotoSerif'),),
    );
  }

  Widget _body(){
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.04),
      child: Row(
        children: <Widget>[
          _insurancePack1(),
          _insurancePack2(),
          _insurancePack3()
        ],
      ),
    );
  }

  Widget _insurancePack1(){
    return Container(
      padding: EdgeInsets.only(left: SizeConfig.blockVerticalSize * 1.1),
      width: MediaQuery.of(context).size.width * 0.37,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(SizeConfig.blockHorizontalSize * 1.4),
            child: Icon(
              MdiIcons.busClock,
              size: SizeConfig.blockVerticalSize * 3.8,
              )
          ),
          Text(
            'Trip cancellation \nby operator',
            style: TextStyle(
              fontSize: SizeConfig.blockVerticalSize * 1.89,
              fontWeight: FontWeight.w500,
              fontFamily: 'NotoSerif'),
              ),
          SizedBox(height: SizeConfig.blockVerticalSize * 1.1,),
          Text(
            '100% personal\n  refunds',
            style: TextStyle(
              color: Colors.grey,
              fontSize: SizeConfig.blockVerticalSize * 1.62,
              fontFamily: 'NotoSerif'))
        ],
      ),
    );
  }

  Widget _insurancePack2(){
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(SizeConfig.blockHorizontalSize * 1.4),
            child: Icon(
              MdiIcons.accountAlertOutline,
              size: SizeConfig.blockVerticalSize * 3.8,
              )
          ),
          Text(
            'Personal\naccident',
            style: TextStyle(fontSize: SizeConfig.blockVerticalSize * 1.89,fontWeight: FontWeight.w500,fontFamily: 'NotoSerif'),),
          SizedBox(height: SizeConfig.blockVerticalSize * 1.1,),
          Text(
            '  TZs 100000,\n insurance cover',
            style: TextStyle(
              color: Colors.grey,
              fontSize: SizeConfig.blockVerticalSize * 1.62,fontWeight: FontWeight.normal,fontFamily: 'NotoSerif'))

        ],
      ),
    );
  }

  Widget _insurancePack3(){
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(SizeConfig.blockHorizontalSize * 1.4),
            child: Icon(
              MdiIcons.bagCarryOnOff,
              //size: 25.0,
              size: SizeConfig.blockVerticalSize * 3.8,
              )
          ),
          Text(
            'Baggage\n loss',
            style: TextStyle(
              fontSize: SizeConfig.blockVerticalSize * 1.89,
              fontWeight: FontWeight.w500,fontFamily: 'NotoSerif'),),
          SizedBox(height: SizeConfig.blockVerticalSize * 1.1,),
          Text(
            '  TZs 100000,\n insurance cover',
            style: TextStyle(
              color: Colors.grey,
              fontSize: SizeConfig.blockVerticalSize * 1.62,
              fontFamily: 'NotoSerif',
              fontWeight: FontWeight.normal))

        ],
      ),
    );
  }

 
  
  String _insure = 'No';
  
  Widget _yesRadio(){
    return Radio(
      groupValue: _insure,
      activeColor: Theme.of(context).primaryColor,
      value: 'Yes',
      onChanged: (String value) async{
        setState(() {
         _insure = value; 
        });
        _busController.addInsurance();
      },
    );
  }

  Widget _yesRow(){
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      child: Row(
        children: <Widget>[
          _yesRadio(),
          _yesText()
        ],
      ),
    );
  }

  Widget _yesText(){
    return Flexible(
      child: Text.rich(
        TextSpan(
          text: 'Yes, secure my trip with insurance, ',
          style: TextStyle(fontFamily: 'NotoSerif'),
          children: [
            TextSpan(
              text: 'I agree to \nthe ',
              style: TextStyle(fontFamily: 'NotoSerif')
            ),
            TextSpan(
              text: 'Terms & Conditions ',
              style: TextStyle(color: Colors.orangeAccent,fontFamily: 'NotoSerif'),
            ),
            TextSpan(
              text: 'and ',
              style: TextStyle(fontFamily: 'NotoSerif')
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(color: Colors.orangeAccent,fontFamily: 'NotoSerif')
            )
          ]
        )
      ),
    );


  }

 Widget _noRow(){
   return Row(
     children: <Widget>[
       _noRadio(),
       _noText()
     ],
   );
 }

 Widget _noRadio(){
    return Radio(
      groupValue: _insure,
      activeColor: Theme.of(context).primaryColor,
      value: 'No',
      onChanged: (String value) async{
        setState(() {
         _insure = value; 
        });
        _busController.removeInsurance();
      },
    );
  }

  Widget _noText(){
    return Text("No, I don't want insurance");
  }

}