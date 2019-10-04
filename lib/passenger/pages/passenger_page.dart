import 'package:flutter/material.dart';
import 'package:mimi/bus/busProvider/bus_controller.dart';
import 'package:mimi/bus/slide_panel/panel_page2.dart';
import 'package:mimi/global/route_title.dart';
import 'package:mimi/home/homeProvider/home_provider.dart';
import 'package:mimi/insurance/insurance_card.dart';
import 'package:mimi/locator.dart';
import 'package:mimi/passenger/passengerProvider/passenger_controller.dart';
import 'package:mimi/passenger/passenger_card.dart';
import 'package:mimi/passenger/passenger_rich_text.dart';
import 'package:mimi/payment/pages/payments_method_page.dart';
import 'package:mimi/tickets/tickets_page.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';



class PassengerPage extends StatelessWidget {
  
  final _formKey = locator<GlobalKey<FormState>>();

  @override
  Widget build(BuildContext context) {
    
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {
        return Consumer<BusController>(
          builder: (context, controller,_) => 
          Scaffold(
            appBar: AppBar(
              title: RoutesTitle()
            ),
            resizeToAvoidBottomInset: false,
            body: Container(
              child: PassengerBottomBar(
                body: PassengerCustomScrollView(
                  insuranceCard: _insuranceCard(),
                  passengerListCard: PassengerListCard(),
                  richTExt: _richText(),
                ),
                panel: PanelPage2(
                  buttonStatus: 'BOOK NOW',
                  currentSeats: controller.seats,
                  currentFare: controller.fare,
                  navigation: (){
                    if(_formKey.currentState.validate()){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> TicketsPage()));
                    }
                  },
                ),
              ),

            )
          ),
        );
      }
    );
  }

  Widget _insuranceCard(){
    return SliverToBoxAdapter(
      child: InsuranceCard(),
    );
  }

  Widget _richText(){
    return SliverToBoxAdapter(
      child:PassengerRichText(buttonText: 'Book Now',),
    );
  }
}



class PassengerCustomScrollView extends StatefulWidget {

  final Widget passengerListCard;
  final Widget insuranceCard;
  final Widget richTExt;
  
  
  const PassengerCustomScrollView({Key key, this.passengerListCard, this.insuranceCard, this.richTExt}) : super(key: key);

  @override
  _PassengerCustomScrollViewState createState() => _PassengerCustomScrollViewState();
}

class _PassengerCustomScrollViewState extends State<PassengerCustomScrollView> {

   final focusScope = locator<FocusScopeNode>();
   final scrollController = locator<ScrollController>();
   final formKey = locator<GlobalKey<FormState>>();


  @override
  Widget build(BuildContext context) {
    return _customScrollView();
  }

  
  Widget _customScrollView(){
    
    return Scrollbar(
        child: Form(
          key: formKey,
          child: FocusScope(
            node: focusScope,
            child: CustomScrollView(
              controller: scrollController,
               slivers: <Widget>[
                SliverPadding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.78),),
                PaymentsTitle(title: 'Passengers information',),
                // SliverPadding(
                //   padding: EdgeInsets.only(
                //     left: SizeConfig.blockHorizontalSize * 2.78,
                //     top: SizeConfig.blockHorizontalSize * 2),
                //   sliver: SliverToBoxAdapter(
                //     child: PaymentsTitle(title: 'Passengers Information',),
                // ),),
                //SliverPadding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.78),),
                widget.passengerListCard,
                SliverPadding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.78),),
                widget.insuranceCard,
            //    SliverPadding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 2.78),),
              //  widget.richTExt,
                SliverPadding(padding: EdgeInsets.only(top: SizeConfig.blockHorizontalSize * 57.78,))

              ],
            ),
          ),
        ),
      );
  }


}




class PassengerBottomBar extends StatelessWidget {

  final Widget body;
  final Widget panel;

  PassengerBottomBar({this.panel,this.body});

  @override
  Widget build(BuildContext context) {
    return Consumer<PassengerController>(
      builder: (context,controller, _){
        return _slidingUpPanel();
      },
    );
  }

  Widget _slidingUpPanel(){
    return SlidingUpPanel(
        backdropColor: Colors.black26,
        backdropEnabled: true,
        backdropTapClosesPanel: true,
        backdropOpacity: 0.8,
        color: Colors.grey[100],
        //minHeight: 55.0,
        minHeight: SizeConfig.blockVerticalSize * 7.43,
        isDraggable: false,
        panel:panel,
        body: body,
      
    );
  }
}


class PassengerListCard extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Consumer<BusController>(
      builder: (context,controller, _) =>
      SliverList(
        
        //itemExtent: SizeConfig.blockVerticalSize * 29.9, 
      //  itemExtent: SizeConfig.blockVerticalSize * 30.0,
        delegate: SliverChildBuilderDelegate(
          (context,i) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: PassengerCard(
                seatNumber: controller.seats[i] ?? '12',
              ),
            );
          },
          childCount: controller.seats.length
        ),
        
      ),
    );
  }
}






