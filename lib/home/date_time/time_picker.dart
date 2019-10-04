import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class TimePicker extends StatelessWidget {
  final format = DateFormat("hh:mm aaa");
  @override
  Widget build(BuildContext context) {
    timeDilation = 3.0;

    return Column(children: <Widget>[
     // Text('Basic time field (${format.pattern})'),
      DateTimeField(
        format: format,
        resetIcon: Icon(Icons.clear,size: 15.0,),
        decoration: InputDecoration(
          labelText: 'Time'

        ),
        onShowPicker: (context, currentValue) async {
          final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),

          );
          return DateTimeField.convert(time);
        },
      ),
    ]);
  }
}