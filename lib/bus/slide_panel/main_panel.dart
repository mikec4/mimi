import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mimi/board_drop_location/board/bloc/boardingpoints_bloc.dart';
import 'package:mimi/board_drop_location/board/bloc/boardingpoints_event.dart';
import 'package:mimi/board_drop_location/drop/bloc/dropingpoints_bloc.dart';
import 'package:mimi/board_drop_location/drop/bloc/dropingpoints_event.dart';
import 'package:mimi/board_drop_location/master_location.dart';
import 'package:mimi/bus/busProvider/bus_controller.dart';
import 'package:mimi/bus/pages/custom_body.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
 
import 'panel_page1.dart';
import 'panel_page2.dart';

class MainPanel extends StatefulWidget {

  final String fare;

  MainPanel({this.fare});

  @override
  _MainPaneState createState() => _MainPaneState();
}


class _MainPaneState extends State<MainPanel> {
  

  PanelController _panelController;

  BusController _busController;

  bool panelOpenClose =false;

  void _openPanel() => _panelController.open();

  double get _fare => double.parse(widget.fare);

  @override
  void initState() {
    super.initState();
    _panelController = PanelController();
    
  }

 
  @override
  Widget build(BuildContext context) {

    return Consumer<BusController>(
      builder: (context, controller, _){
        _busController = controller;
        return _buildSlidingUpPanel(selectedSeats: controller.seats);
      },
    );
  }

 
  Widget _buildSlidingUpPanel({List<String> selectedSeats}){
  
    return  Container(
      child: SlidingUpPanel(
        body: CustomBody(openPanel: _openPanel,),
        color: Colors.grey[100],
        minHeight: SizeConfig.blockVerticalSize * 7.2364,
        isDraggable: selectedSeats.length == 0 ? true: false,
        controller: _panelController,
        backdropColor: Colors.black26,
        backdropEnabled: true,
        
        backdropTapClosesPanel: true,
       // backdropOpacity: SizeConfig.blockHorizontalSize * 0.222,
        backdropOpacity: 0.5,
        panel:selectedSeats.length == 0 ? PanelPage1(panelController: _panelController,):
          PanelPage2(
            buttonStatus: 'BOOK NOW',
            navigation: _navigate,
            currentSeats: selectedSeats,
            currentFare: _fare,
        )
      ),
    );
     
  }


  void _navigate() async{

    Navigator.push(context, MaterialPageRoute(builder: (context) => MasterLocation()));
    BlocProvider.of<DropingpointsBloc>(context).add(FetchAllDropingPointsEvent(busId: _busController.busId));
    BlocProvider.of<BoardingpointsBloc>(context).add(FetchAllBoardingPointsEvent(busId: _busController.busId));        
   

    _busController.setFare = _fare;             
  }



}