import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mimi/passenger/model/passenger.dart';
import 'package:mimi/passenger/passengerProvider/passenger_controller.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../locator.dart';

class PassengerCard extends StatefulWidget {
  final String seatNumber;

  PassengerCard({this.seatNumber});

  @override
  _PassengerCardState createState() => _PassengerCardState();
}

class _PassengerCardState extends State<PassengerCard> with AutomaticKeepAliveClientMixin{
  
  String _value = 'Female';
  
  Passenger _passengerModel;

  PassengerController _passengerController;

  final focusScope = locator<FocusScopeNode>();
  final formKey = locator<GlobalKey<FormState>>();

  double _width = SizeConfig.blockVerticalSize * 30.0;


  @override
  void initState() {
    super.initState();
    _passengerModel = Passenger();
  }

  

  @override
  Widget build(BuildContext context) { 

    _passengerController = Provider.of<PassengerController>(context);
    
    return _buildForm();
  }



  Widget _buildForm(){
    return Card(

      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),

       // height: 215.0,
       //height: SizeConfig.blockVerticalSize * 29.055,
      padding: EdgeInsets.all(SizeConfig.blockHorizontalSize * 2.78),
     // height: SizeConfig.blockVerticalSize * 30.0, 
     width: _width,        
     child: _form(),
      ),
    );
  }

  Widget _form(){
    return Container(
      child: Column(
        children: <Widget>[
          _seatNumber(),
          _nameField(),
          _mobileField(),
          _gender()
             
        ],
      ),
    );
  }

  Widget _seatNumber(){
    return Row(
      children: <Widget>[
        Spacer(),
        Text('Seat  '),
        Text(widget.seatNumber)
      ],
    );
  }


  Widget _nameField(){
    return Row(
      children: <Widget>[
       Container(
         //width: 300.0,
         width: SizeConfig.blockHorizontalSize * 83.33,
         child: TextFormField(
          // focusNode: _nameFocus,
           onFieldSubmitted: _onNameSubmit,
           validator:_onNameValidator,
           onSaved: (value){
           },
           keyboardType: TextInputType.text,
           textCapitalization: TextCapitalization.words,
           textInputAction: TextInputAction.next,
           decoration: InputDecoration(
             labelText: 'Name',
            // contentPadding: EdgeInsets.only(top: 1 )
           ),
         ),
       ),
       Icon(
         Icons.person_add
       )
      ],
    );
  }

  void _onNameSubmit(String value) async{
    //FocusScope.of(context).requestFocus(_mobileFocus);
    focusScope.nextFocus();
   _passengerModel.setName = value;
   _passengerModel.setSeatNumber = widget.seatNumber;
    if(formKey.currentState.validate()){}

  }

  String _onNameValidator(String value){
   
     if(value.length < 6){
      setState(() {
        _width = SizeConfig.blockVerticalSize * 40.0;
      });

      return 'Name is required';
    }
  }

  Widget _mobileField(){
    return Row(
      children: <Widget>[
       Container(
        // width: 300.0,
         width: SizeConfig.blockHorizontalSize * 83.33,
         child: TextFormField(
         //  focusNode: _mobileFocus,
           keyboardType: TextInputType.number,
           onFieldSubmitted: _onMobileSubmit,
           textInputAction: TextInputAction.next,
           validator: _onMobileValidator,
           onChanged: (value){},
           decoration: InputDecoration(
             labelText: 'Mobile',
             //contentPadding: EdgeInsets.only(top: 1.0)
           ),
         ),
       ),
       Icon(
         MdiIcons.cellphoneIphone
       )
      ],
    );
  }

  void _onMobileSubmit(String value) async{

     focusScope.nextFocus();
    _passengerModel.setMobile = value;
    _passengerController.addPassenger(_passengerModel);
    if(formKey.currentState.validate()){}

  }

  String _onMobileValidator(String value){

    if(value.length != 10){

      setState(() {

        _width = SizeConfig.blockVerticalSize * 40.0;
      });

      return 'Mobile number should have 10 digits';
    }
    
            
  }

  

  Widget _gender(){
    _passengerModel.setGender = _value;

    return Container(
      width: SizeConfig.blockHorizontalSize * 83.33,
      child: Row(
        children: <Widget>[
          Text('Gender'),
          Radio(
            groupValue: _value,
            activeColor: Theme.of(context).primaryColor,
            value: 'Female',
            onChanged: (value){
              setState(() {
               _value = value; 
              });
             _passengerModel.setGender = value;
            },
          ),
          Text('Female'),
          Radio(
            groupValue: _value,
            activeColor: Theme.of(context).primaryColor,
            value: 'Male',
            onChanged: (value){
              setState(() {
               _value = value; 
              });
              _passengerModel.setGender = value;
            },
          ),
          Text('Male')
        ],
    ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


class CardTextFormField extends StatelessWidget {
  final FocusNode focusNode;
  final String labelText;
  final TextInputType inputType;
  final Function(String) onFieldSubmitted;
  final TextCapitalization textCapitalization;
  final IconData iconData;

  const CardTextFormField({
    Key key, 
    this.focusNode, 
    this.labelText, 
    this.inputType,
    this.onFieldSubmitted,
    this.textCapitalization,
    this.iconData
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          //width: 300.0,
          width: SizeConfig.blockHorizontalSize * 83.33,
          child: TextFormField(
            focusNode: focusNode,
            keyboardType: inputType,
            textCapitalization: textCapitalization,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              labelText: labelText
            ),
          ),
        ),
        Container(
          child : Icon(iconData)
        )
      ],
    );
  }
}

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {

  String _value = 'Female';

  @override
  Widget build(BuildContext context) {
    return _gender();
  }

  Widget _gender(){
    return Container(
      width: SizeConfig.blockHorizontalSize * 83.33,
      child: Row(
        children: <Widget>[
          Text('Gender'),
          Radio(
            groupValue: _value,
            activeColor: Colors.green,
            value: 'Female',
            onChanged: (value){
              setState(() {
               _value = value; 
              });
            },
          ),
          Text('Female'),
          Radio(
            groupValue: _value,
            activeColor: Colors.green,
            value: 'Male',
            onChanged: (value){
              setState(() {
               _value = value; 
              });
            },
          ),
          Text('Male')
        ],
    ),
    );
  }
}