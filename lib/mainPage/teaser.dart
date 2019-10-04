
import 'package:flutter/material.dart';
import 'package:mimi/mainPage/tester.dart';


class Teaser extends StatefulWidget {
  @override
  _TeaserState createState() => _TeaserState();
}

class _TeaserState extends State<Teaser>with SingleTickerProviderStateMixin {
  
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  
  FocusScopeNode _focusScopeNode = FocusScopeNode();

@override
Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text('Teaser'),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.purple,
      child: Text('Yolo'),
      onPressed: (){
        if(_key.currentState.validate()){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> Tester()));

        }
      },
    ),
    body:Container(
      child: FocusScope(
        node: _focusScopeNode,
        child: Form(
          key: _key,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            itemCount: 3,
            itemBuilder: (_, i){
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value){
                        if(value.length <= 3){
                          return 'Names lenght is small';
                        }
                      },
                      onFieldSubmitted: (value){
                        if(_key.currentState.validate()){}
                        _focusScopeNode.nextFocus();

                        
                      },      
                      decoration: InputDecoration(
                        //errorText: 'No data ',
                        labelText: 'Enter names'
                      ),
                    ),

                    TextFormField(
                      textInputAction: TextInputAction.next,
                      validator: (value){
                        if(value.length <= 3){
                          return 'Gender is empty';
                        }
                      },
                      onSaved: (value){
                        // if(_key.currentState.validate()){
                        //   _key.currentState.save();
                        // }
                      },
                      onFieldSubmitted: (value){
                        if(_key.currentState.validate()){}
                        _focusScopeNode.nextFocus();

                      },
                      decoration: InputDecoration(
                        labelText: 'Gender'
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    )
   );
}


}



