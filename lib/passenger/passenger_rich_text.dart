import 'package:flutter/material.dart';

class PassengerRichText extends StatelessWidget {
  final String buttonText;

  PassengerRichText({this.buttonText});

  @override
  Widget build(BuildContext context) {
    return _richText();
  }

  Widget _richText(){
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: RichText(
       text: TextSpan(
         text: 'By clicking on the ',
         style: TextStyle(color: Colors.black,fontFamily: 'NotoSerif'),
         children: [
           TextSpan(
             text: '$buttonText, ',
             style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w500,
              fontFamily: 'NotoSerif'
            )
           ),
           TextSpan(
             text: 'I agree to all the ',
             style: TextStyle(fontFamily: 'NotoSerif')
           ),
          TextSpan(
            text: 'Terms ',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w500,
              fontFamily: 'NotoSerif'
            )
          ),
           TextSpan(
             text: 'and ',
             style: TextStyle(fontFamily: 'NotoSerif')
           ),
           TextSpan(
             text: 'Conditions ',
             style: TextStyle(
               color: Colors.green,
               fontWeight: FontWeight.w500,
               fontFamily: 'NotoSerif'
             )
           ),
           TextSpan(
             text: 'and ',
             style: TextStyle(fontFamily: 'NotoSerif')
           ),
           TextSpan(
             text: 'Privacy Policy',
             style: TextStyle(
               color: Colors.green,
               fontWeight: FontWeight.w500,
               fontFamily: 'NotoSerif'
             )
           )
         ]
       ),
     ),
   );
 }

}