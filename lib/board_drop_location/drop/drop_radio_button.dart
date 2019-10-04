import 'package:flutter/material.dart';
import 'package:mimi/board_drop_location/drop/drop_provider.dart';
import 'package:provider/provider.dart';

class DropRadioButton extends StatefulWidget {
  final String radioValue;

  DropRadioButton({this.radioValue});

  @override
  _DropRadioButtonState createState() => _DropRadioButtonState();
}

class _DropRadioButtonState extends State<DropRadioButton> {

  DropProvider _provider;


  void _initProviders() => _provider = Provider.of<DropProvider>(context);


  @override
  Widget build(BuildContext context) {
    _initProviders();
    return Consumer<DropProvider>(
      builder: (context, model,child) {
        return Radio(
          activeColor: Colors.green,
          groupValue: _provider.groupValue,
          value: widget.radioValue,
          onChanged: _onChange,
        );
      }
    );
  }

  void _onChange(String value){
    _provider.setGroupValue = value;
  }
}