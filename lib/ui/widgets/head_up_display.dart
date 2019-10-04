import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mimi/ui/widgets/spin_loader.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HeadUpDisplay extends StatefulWidget {
  final Widget child;
  final bool state;
  final double width;
  final double height;

  HeadUpDisplay({this.child,this.state,this.width,this.height});

  @override
  _HeadUpDisplayState createState() => _HeadUpDisplayState();
}

class _HeadUpDisplayState extends State<HeadUpDisplay> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  
  Animation<Color> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),);
    
    _animation = Tween<Color>(begin: Colors.transparent,end: Colors.red).animate(_controller);
      
    
    _controller.fling(velocity: 20.0);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      
      child: widget.child,
      inAsyncCall: widget.state,
      opacity: 0.5,
      color: Colors.black54,
      progressIndicator: SpinLoader(),
      offset: Offset(widget.width, widget.height),
    );
  }
}