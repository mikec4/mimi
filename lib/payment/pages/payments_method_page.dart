import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:mimi/bus/bloc/bloc.dart';
import 'package:mimi/bus/busProvider/bus_controller.dart';
import 'package:mimi/global/route_title.dart';
import 'package:mimi/payment/pages/provider/payments_method_controller.dart';
import 'package:mimi/searchResult/searchModel/search_bus.dart';
import 'package:intl/intl.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';

class PaymentsMethodPage extends StatefulWidget {
  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsMethodPage> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: RoutesTitle()),
      body: Scrollbar(
        child: CustomScrollView(
          
          slivers: <Widget>[
            _largeBox(),  
           PaymentsTitle(title: 'Trip details',),
           BusInformationCard(),
           _largeBox(),
           CouponCard(),
           _largeBox(),
           PaymentsTitle(title: 'Payments details',),
           PaymentDetails(),
           _largeBox(),
           PaymentsTitle(title: 'Payments methods',),
           PaymentMethods(),

           SliverPadding(padding: EdgeInsets.only(top: SizeConfig.blockVerticalSize * 6.579),)
          ],
        ),
      ),
    );


  }

  Widget _largeBox(){
    return SliverPadding(
      padding: EdgeInsets.only(top : SizeConfig.blockVerticalSize * 2.05)
      ,
    );
  }
 
}

class PaymentsTitle extends StatelessWidget {
  final String title;

  const PaymentsTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding:  EdgeInsets.symmetric(horizontal: SizeConfig.blockHorizontalSize * 2.88),
      sliver: SliverToBoxAdapter(
        child: Text('$title',style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class PaymentDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BusController>(
      builder: (context, controller,_) {
        print('IS INSURED ${controller.insured}');
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHorizontalSize * 2.78),
          sliver: SliverToBoxAdapter(
            child: Card(
              elevation: 0.0,  
              child: Container(
                padding: EdgeInsets.all(SizeConfig.blockHorizontalSize * 2.5),
                child: Column(
                  children: <Widget>[
                    CustomRow(),
                    _smallBox(),
                    FareTax(),
                    _smallBox(),
                    InsuredWidget(),
                    _smallBox(),
                    CouponCode(),
                    _smallBox(),
                    TotalFare()
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _smallBox(){
    return SizedBox(
      height: SizeConfig.blockVerticalSize * 0.5,  
    );
  }
}

class CustomRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<BusController>(
      builder: (context, controller,_) {
        return Container(
          child: Row(
              children: <Widget>[
                Text(
                  'Total Fare  (${controller.seats.length} tickets)',),
                Spacer(),
                Text(
                  '${_calculateTax(seats: controller.seats.length, fare: controller.fare)}',
                  ),

              ],
            ),
        );
      }
    );
  }

  String _calculateTax({double fare,int seats}){
    var _fare = (fare * seats);
    var _tax = (fare * seats) * 0.18;
    var _remainder = _fare - _tax;
    
    var formatter = FlutterMoneyFormatter(
      amount: _remainder,
      settings: MoneyFormatterSettings(
        symbol: 'Tsh',
        thousandSeparator: ','
      )
    );
    return formatter.output.symbolOnLeft;

  }

}

class FareTax extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BusController>(
      builder: (context,controller,_){

        
        return Container(
          child: Row(
            children: <Widget>[
              Text('VAT (18%)'),
              Spacer(),
              Text('${_taxFare(seats: controller.seats.length,fare: controller.fare)}')
              //Text('Tsh  ${_taxFare(seats: controller.seats.length, fare: controller.fare)}')
            ],
          ),
        );
      },
    );
  }

  String _taxFare({double fare, int seats}){

    var product = (fare * seats) * 0.18;

    var flutterAmount = FlutterMoneyFormatter(
          amount: product,
          settings: MoneyFormatterSettings(
            symbol: 'Tsh',
            thousandSeparator: ','
          )
        );

    return flutterAmount.output.symbolOnLeft;
  }
}


class InsuredWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BusController>(
      builder: (_,controller,child){
        return Container(
          child: Row(
            children: <Widget>[
              Text(controller.insured ? 'Insured (Yes)' : 'Insured  (No)') ,
              Spacer(),
              Text(controller.insured ? '${_moneyFormatter(insurance: controller.insurance * controller.seats.length)}' : '${_moneyFormatter(insurance: 0.0)}') 
            ],
          ),
        );
      },
    );
  }

  String _moneyFormatter({double insurance}){
    var formatter = FlutterMoneyFormatter(
      amount: insurance,
      settings: MoneyFormatterSettings(
        symbol: 'Tsh',
        thousandSeparator: ','
      )
    );

    return formatter.output.symbolOnLeft;
  }
}

class CouponCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text('Coupon'),
          Spacer(),
          Text('${_moneyFormatter(amount: 0.0)}')
        ],
      ),
    );
  }

  String _moneyFormatter({double amount}){
    var _formatter = FlutterMoneyFormatter(
      amount: amount,
      settings: MoneyFormatterSettings(
        symbol: 'Tsh',
        thousandSeparator: ','
      )
    );

    return _formatter.output.symbolOnLeft;
  }
}


class TotalFare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BusController>(
      builder: (context,controller,_){
        return Container(
          child: Row(
            children: <Widget>[
              Text('Total Amount',style: TextStyle(fontWeight: FontWeight.bold),),
              Spacer(),
              Text('${_moneyFormatter(fare : controller.fare * controller.seats.length)}',style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
        );
      },
    );
  }

  String _moneyFormatter({double fare}){
    var formatter = FlutterMoneyFormatter(
      amount: fare,
      settings: MoneyFormatterSettings(
        symbol: 'Tsh',
        thousandSeparator: ','
      )
    );

    return formatter.output.symbolOnLeft;
  }
}




class BusInformationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHorizontalSize * 2.78),  
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<BusBloc,BusState>(
          builder: (context, state){
            if(state is GetSelectedBusState){
              return _main(context, state.selectedBus);
            }
          },
        ),
      ),
    );
  }

  Widget _main(BuildContext context, SearchBus bus){

    var dateFormat = DateFormat('EEEE, d MMM yyyy');

    return Card(
        elevation: 0.0,
        child: Container(
           padding: EdgeInsets.all(SizeConfig.blockHorizontalSize * 2.5),
          // width: MediaQuery.of(context).size.width * 0.97,
          // height: MediaQuery.of(context).size.height * 0.2,
          width: SizeConfig.blockHorizontalSize * 110,
          height: SizeConfig.blockVerticalSize * 15.5,   
           
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                dateFormat.format(bus.date.toDate()),
                style: TextStyle(
                 // fontSize:SizeConfig.blockVerticalSize * 2.3,
                  fontWeight: FontWeight.bold),),
              _smallBox(),
              Text(
                bus.name,
                style: TextStyle(
                  //fontSize: SizeConfig.blockVerticalSize * 2.3,
                  fontWeight: FontWeight.w400),),
             // _smallBox(),
             // Text('Total Fare : ' + bus.fare ?? '',style: TextStyle(fontSize: SizeConfig.blockVerticalSize * 2.0,fontWeight: FontWeight.w400),),
              _smallBox(),
              Text(
                'Departure (${bus.departureTime}): ' + bus.route['From'],
                style: TextStyle(
                  //fontSize: SizeConfig.blockVerticalSize * 2.0,
                fontWeight: FontWeight.w400),),
              _smallBox(),
              Text('Arrival (${bus.arriveTime}) : ' + bus.route['To'],
              style: TextStyle(
                //fontSize: SizeConfig.blockVerticalSize * 2.0,
                fontWeight: FontWeight.w400))
            ],
          ),
        ),
      );
  }

   Widget _largeBox(){
    return SizedBox(
      height: SizeConfig.blockVerticalSize * 2.05,
    );
  }

  Widget _smallBox(){
    return SizedBox(
      height: SizeConfig.blockVerticalSize * 0.5,  
    );
  }  

}

class CouponCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHorizontalSize * 2.78),  
      sliver: SliverToBoxAdapter(
        child: Card(
            elevation: 0.0,
            child: Container(
              // width: MediaQuery.of(context).size.width * 0.96,
              // padding: EdgeInsets.only(left: 5.0),
              width: SizeConfig.blockHorizontalSize * 95.0,  
              padding: EdgeInsets.only(left: SizeConfig.blockHorizontalSize * 0.5),
              child: Row(

                children: <Widget>[
                  Container(
                   // width: 242.0, 
                   width: SizeConfig.blockHorizontalSize * 67.2222,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Promotion code',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent
                          )
                        )
                      ),
                    ),
                  ),
                  MaterialButton(
                    elevation: 0.0,
                    height: SizeConfig.blockVerticalSize * 5.0,
                    onPressed: (){},
                    textColor: Colors.white,
                    
                    child: Text('Apply'),
                    color: Colors.orangeAccent,
                  )
                ],
              ),
          ),
        ),
      ),
    );

  }
}

class PaymentMethods extends StatefulWidget {

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {

  List<String> _pesa = ['Vodacom-Mpesa','TigoPesa','Airtel-Money','Halotel-Pesa','T-Pesa'];
  String _imagePath = 'assets/TigoPesa-logo.png';
  String _groupValue = '';
  
  @override
  Widget build(BuildContext context) {

    return Consumer<PaymentMethodController>(
      builder: (context, controller,_) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHorizontalSize * 2.78),  
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context,i) {
                return Card(
                  elevation: 0.0,
                  child: Container(
                    child: ExpansionTile(
                      title: CustomRadioTile(name: _pesa[i],),
                     // title: _radioListTile(value: _pesa[i],imagePath: _pesa[i],),
                      onExpansionChanged: (isExpanded){
                        if(isExpanded){
                          // setState(() {
                          //   _groupValue = _pesa[i];
                          // });
                          controller.setGroupValue = _pesa[i];
                        }else {
                          // setState(() {
                          //   _groupValue = '';
                          // });
                          controller.setGroupValue = '';
                        }
                      },
                      
                      children: <Widget>[
                       // _column(),
                        _checkBox(),
                        // CustomCheckBox(name: _pesa[i],), 
                        _row()
                        //BookNowButton()   
                      ],
                    ),
                  ),
                );
              },
              childCount: _pesa.length
            ),
          ),
        );
      }
    );
  }

  Widget _column(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockHorizontalSize * 2.22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ... _lists
        ],
      ),
    );
  }


  bool _isChecked = false;

  var _lists = [

    Text('1. Go to TigoPesa menu by dialing *150*01#'),
    Text('2. Select #4 - Pay bills'),
    Text('3. Select #2 - Look up company'),
    Text('4. Select #7 - Travel'),
    Text('5. Select #1 - Yai'),
    Text('6. Enter reference number'),
    Text('7. Enter amount'),
    Text('8. Enter pin'),
    Text('9. Press 1 to confirm or 2 to decline'),

  ];

  Widget _checkBox(){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal : SizeConfig.blockHorizontalSize * 2.22),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: _isChecked,
            onChanged: (value){
              setState(() {
                _isChecked = value;
              });
            },
          ),
          Flexible(
            child: RichText(
              text: TextSpan(
                text: 'Yes,I agree to all the ',
                style: TextStyle(color: Colors.black,fontFamily: 'NotoSerif'),
                children: [
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'NotoSerif'),
                    
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(color: Colors.black,fontFamily: 'NotoSerif')
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'NotoSerif')
                  )
                ]
              ),
            )
            )
        ],
      ),
    );
  }



  Widget _row(){
    return Row(
      children: <Widget>[
        Spacer(),
        MaterialButton(
          color: Colors.orangeAccent,
          elevation: 0.0,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.white,
          textColor: Colors.white,
          child: Text('BOOK NOW'),
          onPressed: !_isChecked ? null: (){},
        )
      ],
    );
  }


  Widget _radioListTile({String value,String imagePath}){
   return Row(
     children: <Widget>[
       Radio(
         groupValue: _groupValue,
         value: value,
         onChanged: (value){},
       ),
        Container(
          child: Text(imagePath),
        )
     ],
   );
 }

 
}



class CustomRadioTile extends StatelessWidget {
  final String name;
  CustomRadioTile({this.name});
  @override
  Widget build(BuildContext context) {
     return Consumer<PaymentMethodController>(
       builder: (context, controller,_) {
         return Row(
         children: <Widget>[
           Radio(
             groupValue: controller.groupValue,
             value: name,
             onChanged: (value){},
           ),
            Container(
              child: Text(name),
            )
         ],
   );
       }
     );
  }
}


class CustomCheckBox extends StatefulWidget {
  final String name;
  
  CustomCheckBox({this.name});

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentMethodController>(
      builder: (_,controller,child){
        return Padding(
      padding:  EdgeInsets.symmetric(horizontal : SizeConfig.blockHorizontalSize * 2.22),
      child: Row(
        children: <Widget>[
          Checkbox(
            value: _isChecked,
            onChanged: (value){ 
              setState(() {
                _isChecked = !_isChecked;
              });

            },
          ),
          Flexible(
            child: RichText(
              text: TextSpan(
                text: 'Yes,I agree to all the ',
                style: TextStyle(color: Colors.black,fontFamily: 'NotoSerif'),
                children: [
                  TextSpan(
                    text: 'Terms & Conditions',
                    style: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'NotoSerif'),
                    
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(color: Colors.black,fontFamily: 'NotoSerif')
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(color: Theme.of(context).primaryColor,fontFamily: 'NotoSerif')
                  )
                ]
              ),
            )
            )
        ],
      ),
    );
      },
    );
  }
}


class BookNowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentMethodController>(
      builder: (_,controller,child){
        return Row(
      children: <Widget>[
        Spacer(),
        MaterialButton(
          color: Colors.orangeAccent,
          elevation: 0.0,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.white,
          textColor: Colors.white,
          child: Text('BOOK NOW'),
          onPressed: !controller.isChecked ? null: (){},
        )
      ],
    );
      },
    );
  }
}





// class BookNowButton extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {

//     return BlocBuilder<BusBloc,BusState>(
//       builder: (context, state){

//         if(state is GetSelectedBusState){


//           return Consumer<PassengerController>(
//             builder: (context,controller,_){


//               return SliverToBoxAdapter(
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: MaterialButton(
//                   child: Text('BOOK NOW'),
//                   textColor: Colors.white,
//                   onPressed: () async {

//                     var _entity = PaymentEntity(selectedBus: state.selectedBus,passengers: controller.passengers);
//                     var _passengers = _entity.convertPassenger();

//                     var _bloc = BlocProvider.of<PaymentBloc>(context);

//                     _bloc.dispatch(MakePaymentEvent(passengers: _passengers));

//                     Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavigationPage()));
//                   },
//                   color: Colors.orangeAccent,
//                   minWidth: SizeConfig.blockHorizontalSize * 80.0,
//                   height: SizeConfig.blockVerticalSize * 6.0,

//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     );
//   }

// } 




