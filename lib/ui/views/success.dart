
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mimi/ui/widgets/spin_loader.dart';
import 'package:mimi/ui/widgets/success_widget.dart';

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  bool _load = false;

  @override
  Widget build(BuildContext context) {
    _submit();
    return Scaffold(
      //appBar: AppBar(title: Text('Success page'), backgroundColor: Colors.white,),
      body: Container(
        alignment: Alignment.center,
        child:  Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.3,
              child: ModalBarrier(
                color: Colors.grey,
                dismissible: false,
              ),
            ),
            !_load ? SpinLoader(): SuccessWidget()
          ],
        ),
      ),
    );
  }

 Widget _button(){
    return  MaterialButton(
      child: Text('LOAD'),
      color: Colors.black,
      minWidth: 200.0,
      height: 45.0,
      textColor:Colors.white,
      onPressed: _submit,

    );
 }

  void _submit(){


    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        _load = true;
      });
    });
  }
}
