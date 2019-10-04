import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class Insurance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0,top:5.0),
          child: Text.rich(
            TextSpan(
              text: ' By clicking next(arrow-icon),I agree to all the \n ',
              children: [
                TextSpan(
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                      ..onTap=() => Navigator.pushNamed(context, '/termsConditions'),
                     text: 'Terms & Conditions',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.green
                      ),

                    ),
                    TextSpan(
                      text: ' and '
                    ),
                    TextSpan(
                      text: 'Privacy Policy.',
                      recognizer: TapGestureRecognizer()
                      ..onTap = (){
                       Navigator.pushNamed(context, '/privacyPolicy');
                      },
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.green
                      )
                    ),
                  ]
                )
              ]
            )
          ),
        )
      ],
    );
            }
  
}
          
