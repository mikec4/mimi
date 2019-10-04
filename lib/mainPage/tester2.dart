import 'dart:math';

import 'package:flutter/material.dart';

class Tester2 extends StatefulWidget {
  @override
  _Tester2State createState() => _Tester2State();
}

class _Tester2State extends State<Tester2> {

  List<String> _names = ['Michael','Clara','Lyla','Joh','Food','Meat','Mimi'];
  String _value = '';
  ScrollController _scrollController = ScrollController();
  
  GlobalKey<AnimatedListState> _state = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tester 2'),),
      body: Container(
        alignment: Alignment.center,
        child: Transform(
          transform: Matrix4.skewY(-10.0),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        )
      ),
    );
  }
  
  void _insertItem(i){
    _state.currentState.insertItem(i,duration : Duration(milliseconds: 1000));
  }
  void _removeItem(int i){
    _state.currentState.removeItem(i, (context,animation){
      return FadeTransition(
        opacity: animation.drive(Tween(begin:0.0,end:0.0)),
        child: ListTile(title: Text(_names[i],style: Theme.of(context).textTheme.subtitle,),),
      );
    },duration: Duration(milliseconds: 100));
  }
}