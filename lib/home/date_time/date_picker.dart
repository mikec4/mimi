import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mimi/home/homeProvider/home_provider.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';



class DatePicker extends StatelessWidget {
 
  final format = DateFormat("dd-MM-yyyy");
  

  @override
  Widget build(BuildContext context) {

    var _homeProvider = Provider.of<HomeProvider>(context);

   return Container(
          padding: EdgeInsets.only(
            top: SizeConfig.blockVerticalSize * 2.03,
            left: SizeConfig.blockHorizontalSize * 4.17,
            right: SizeConfig.blockHorizontalSize * 4.17
            ),
          child: DateTimeField(
            format: format,
            style: TextStyle(color: Colors.black),
            readOnly: true,
            resetIcon: Icon(Icons.clear,size: SizeConfig.blockHorizontalSize * 4.17,),
            onChanged: (dt) async{
              _homeProvider.setDate(dt);
            },
            decoration: InputDecoration(
              prefixIcon: Icon(FontAwesomeIcons.calendarAlt),
              labelText: 'Select Date',
              labelStyle: TextStyle(fontSize: SizeConfig.blockHorizontalSize * 4.17,color: Theme.of(context).primaryColor),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor
                )
              )
            ),
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,

                  firstDate: DateTime.now(),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
          ),
      
   );
  }

}



// class BasicTimeField extends StatelessWidget {
//   final format = DateFormat("HH:mm");
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Text('Basic time field (${format.pattern})'),
//       DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) async {
//           final time = await showTimePicker(
//             context: context,
//             initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//           );
//           return DateTimeField.convert(time);
//         },
//       ),
//     ]);
//   }
// }

// class BasicDateTimeField extends StatelessWidget {
//   final format = DateFormat("yyyy-MM-dd HH:mm");
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Text('Basic date & time field (${format.pattern})'),
//       DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) async {
//           final date = await showDatePicker(
//               context: context,
//               firstDate: DateTime(1900),
//               initialDate: currentValue ?? DateTime.now(),
//               lastDate: DateTime(2100));
//           if (date != null) {
//             final time = await showTimePicker(
//               context: context,
//               initialTime:
//                   TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
//             );
//             return DateTimeField.combine(date, time);
//           } else {
//             return currentValue;
//           }
//         },
//       ),
//     ]);
//   }
// }
