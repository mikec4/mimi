import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mimi/login/bloc/login_bloc.dart';
import 'package:mimi/login/bloc/login_event.dart';
import 'package:mimi/login/pages/facebook_login_page.dart';
import 'package:mimi/login/pages/google_login_page.dart';
import 'package:mimi/login/pages/mobile_login_page.dart';
import 'package:mimi/login/provider/user_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        slivers: <Widget>[
          CustomSliverList()
        ],
      ),      
    );
  }
}


class CustomSliverList extends StatefulWidget {
  @override
  _CustomSliverListState createState() => _CustomSliverListState();
}

class _CustomSliverListState extends State<CustomSliverList> {


  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 150.0,horizontal: 20.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          BusIcon(),
         SizedBox(height: 20.0,),
          AppHeader(),
          SizedBox(height: 150.0,),
         // MobileTextField(),
         // SizedBox(height: 20.0,),
         // LoginButton(),
         // SizedBox(height: 20.0,),
          GoogleLogInButton(),         
          SizedBox(height: 20.0,),
          OrWidget(),
          SizedBox(height: 20.0,),
          FacebookLogInButton()
        ]),
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Yai',
        style: TextStyle(
          fontFamily: 'NothingYouCouldDo',
          fontSize: 35.0,color: Colors.white,fontWeight: FontWeight.w600
        ),                 
      ),
    );
  }
}

class BusIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Icon(MdiIcons.bus,size : 60,color : Colors.white),
    );
  }
}

// class MobileTextField extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//       child: TextFormField(
//         cursorColor: Colors.white,
//         textInputAction: TextInputAction.done,
//         keyboardType: TextInputType.phone,
//         style: TextStyle(color: Colors.white),
//         onFieldSubmitted: (value){
//           Provider.of<UserProvider>(context).setMobileNumber = value;
//         },
//         decoration: InputDecoration(
//           labelText: 'Mobile',
//           labelStyle: TextStyle(color: Colors.white),
//           prefixIcon: Icon(MdiIcons.cellphoneIphone,size : 25,color: Colors.white),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//             color: Colors.white
//             )
//           ),
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//             color: Colors.white
//           )
//         )
//       ),
//     ),
//     );
//   }
// }



// class LoginButton extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     final _user = Provider.of<UserProvider>(context);
//     return MaterialButton(
//       child: Text('LOGIN'),
//       textColor: Colors.white,
//       color: Colors.orangeAccent,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5.0)
//       ),
//       height: 50.0,
//       minWidth: 300.0,
//       onPressed: (){
//         Navigator.push(context, MaterialPageRoute(builder: (_) => MobileLoginPage()));
//         BlocProvider.of<LoginBloc>(context).dispatch(VerifyMobileNumberLoginEvent(mobile: _user.mobileNumber));
//       },
//     );
//   }
// } 


class GoogleLogInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 50.0,
      child: GoogleSignInButton(
        key: Key('GOOGLESIGNIN'),
        borderRadius: 5,
        darkMode: false,
        text: 'Continue with Google',
        onPressed: (){
          BlocProvider.of<LoginBloc>(context).add(GoogleLoginEvent());
          Navigator.push(context, MaterialPageRoute(builder: (context)=> GoogleLoginPage()));
        },
      ),
    );
  }
}

class FacebookLogInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 50.0,
      child: FacebookSignInButton(
        key: Key('FACEBOOKSIGNIN'),
        borderRadius: 5,
        text: 'Continue with Facebook',
        onPressed: (){
          BlocProvider.of<LoginBloc>(context).add(FacebookLoginEvent());
          Navigator.push(context, MaterialPageRoute(builder: (context)=> FacebookLoginPage()));
        },
      ),
    );
  }
}


class OrWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    new Expanded(
                      child: new Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(border: Border.all(width: 0.5,color: Colors.white)),
                      ),
                    ),
                    Text(
                      "OR CONNECT WITH",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    new Expanded(
                      child: new Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0.5,color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              );

  }
}