import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mimi/bus/busProvider/bus_controller.dart';
import 'package:mimi/seat/bloc/bloc.dart';
import 'package:mimi/seat/model/seat.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';


class SeatButton extends StatefulWidget {
  final int seatIndex;
  SeatButton({this.seatIndex});

  @override
  _SeatButtonState createState() => _SeatButtonState();
}

class _SeatButtonState extends State<SeatButton> {

  bool _selectSeat = false;

  List<Seat> _seats = [];
  List<String> _currentSelectSeatNumber = [];
  List<String> _currentGender = [];
  
  Seat _seat;

  int get seatIndex => widget.seatIndex;
  String get seatNumber => widget.seatIndex.toString();

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return BlocBuilder<SeatBloc, SeatState>(

      builder: (context, state){
        return Consumer<BusController>(
           builder: (context, controller, _){
            if(state is ListSeatState){
        
              _seats = state.seats;
              return _build(controller);
            }
          },
        );
      },
    );
  }

  Widget _build(BusController controller){
    print('SIZES ${SizeConfig.blockHorizontalSize} and ${SizeConfig.blockVerticalSize}');
    return SizedBox(
      key: Key(seatNumber),
      width: SizeConfig.blockHorizontalSize * 7.8,
      height: SizeConfig.blockVerticalSize * 4,

      // width: 30.0,
      // height: 30.0,
      child: MaterialButton(
        animationDuration: Duration(milliseconds: 100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)
        ),
        elevation: 0.0,
        disabledColor: _seatGender() ? Colors.pink : Colors.cyan,
        disabledElevation: 0.0,
        color: _selectSeat ? Colors.green : Colors.grey[300],
        onPressed: _bookedSeat() ? null : () async{
        controller.addSeats = seatNumber;
        _onSelectedSeat();
        },
      )
    );
  }

  void _onSelectedSeat()  async{
    setState(() {
     _selectSeat = !_selectSeat; 
    });

  }

  bool _bookedSeat(){

    for (var seat in _seats){
      _currentSelectSeatNumber.add(seat.seatNumber);
      
    }

    return _currentSelectSeatNumber.contains(seatNumber);
  }

  bool _seatGender(){

    Seat currentSeat = Seat(seatNumber: seatNumber,gender: 'Female');

    List<Seat> current = [];

    for (var seat in _seats){
      current.add(seat);
    }

    return current.contains(currentSeat);
  }


}
