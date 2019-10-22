import 'package:flutter/material.dart';
import 'package:mimi/board_drop_location/board/board_provider.dart';
import 'package:provider/provider.dart';

class BoardRadioButton extends StatefulWidget {
  
  final String radioValue;
  final TabController tabController;

  BoardRadioButton({this.radioValue,this.tabController});

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<BoardRadioButton> {
  
  BoardProvider _provider;

  void _initProviders() => _provider = Provider.of<BoardProvider>(context);

  @override
  Widget build(BuildContext context) {
     _initProviders();
     return Radio(
      // key: Key(widget.radioValue),
          activeColor: Colors.green,
          groupValue: _provider.groupValue,
          value: widget.radioValue,
          onChanged: _onChange,

    );
  }

  void _onChange(String value){
    _provider.setGroupValue = value;
  }
}

