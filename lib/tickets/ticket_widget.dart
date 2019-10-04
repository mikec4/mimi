import 'package:flutter/material.dart';
import 'package:mimi/clippers/card_clipper.dart';
import 'package:mimi/passenger/model/passenger.dart';
import 'package:mimi/searchResult/searchModel/search_bus.dart';
import 'package:intl/intl.dart';
import 'package:mimi/utils/size_config.dart';

class TicketWidget extends StatelessWidget {
  final Passenger passenger;
  final SearchBus selectedBus;

  TicketWidget({this.passenger,this.selectedBus});

  @override
  Widget build(BuildContext context) {
    return CardContainer(passenger: passenger,selectedBus : selectedBus,);
  }
}



class CardContainer extends StatelessWidget {
  final Passenger passenger;
  final SearchBus selectedBus;

  CardContainer({this.passenger,this.selectedBus});

  @override
  Widget build(BuildContext context) {
 
    var dateFormat = DateFormat("d MMM yyyy");

    return  Container(
     // padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 20.0),
     padding: EdgeInsets.only(
       left: SizeConfig.blockHorizontalSize * 3.2,
       right:  SizeConfig.blockHorizontalSize * 3.2,
       bottom: SizeConfig.blockVerticalSize * 3.0),
      child: ClipPath(
        clipper: CardClipper(radius: 13.0),
        child: Card(
          child: Container(
           // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
            //height: MediaQuery.of(context).size.height * 0.3,
            //height: SizeConfig.blockVerticalSize * 100,
            padding: EdgeInsets.symmetric(vertical: SizeConfig.blockVerticalSize * 3.0,horizontal: SizeConfig.blockHorizontalSize * 4.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: SizeConfig.blockVerticalSize * 1.8,color: Colors.grey
                    )),
                //SizedBox(height: 2.5,),
                _smallBox(),
                Text(
                  passenger.name ?? 'Michael Ntiriniga',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    //fontSize: SizeConfig.blockVerticalSize * 2.3
                    ),
                    ),
                _largeBox(),
                TextHeader(firstText: 'Mobile',secondText: 'Gender',),
                _smallBox(),
                TextBody(firstText: passenger.mobile ?? '',secondText: passenger.gender ?? '',),
                _largeBox(),
                TextHeader(firstText: 'Seat',secondText: 'Fare',),    
                _smallBox(),
                TextBody(firstText: passenger.seatNumber ?? '',secondText: selectedBus.fare ?? '',),
                _largeBox(),
                TextHeader(firstText: 'From',secondText: 'Destination',),
                _smallBox(),
                TextBody(firstText: selectedBus.route['From'] ?? '',secondText: selectedBus.route['To'] ?? '',),        
                _largeBox(),
                TextHeader(firstText: 'Departure', secondText: 'Arrive',),
                _smallBox(),
                TextBody(firstText: dateFormat.format(selectedBus.date.toDate()) ?? '', secondText: dateFormat.format(selectedBus.date.toDate()) ?? '',),
                _smallBox(),
                Row(
                  children: <Widget>[
                    Text(selectedBus.departureTime ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    //fontSize: SizeConfig.blockVerticalSize * 1.8,
                    color: Colors.grey)),
                    Spacer(),
                    Text(selectedBus.departureTime ?? '',
                    style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,
                   // fontSize: SizeConfig.blockVerticalSize * 1.8
                    ))
                  ],
                ),
              ],
            ) 
          )          
        
        ),
      ),
    );
  
  }

  Widget _example(){
    return ColorFiltered(
      colorFilter: ColorFilter.linearToSrgbGamma(),
    ); 
  }

  Widget _largeBox(){
    return SizedBox(
      height: SizeConfig.blockVerticalSize * 2.05,
    );
  }

  Widget _smallBox(){
    return SizedBox(
      height: SizeConfig.blockVerticalSize * 0.08,  
    );
  }
}



class TextHeader extends StatelessWidget {
  final String firstText;
  final String secondText;

  const TextHeader({Key key, this.firstText, this.secondText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(firstText,style: TextStyle(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockVerticalSize * 1.8,color: Colors.grey)),
        Spacer(),
        Text(secondText,style: TextStyle(fontWeight: FontWeight.normal,fontSize: SizeConfig.blockVerticalSize * 1.8,color: Colors.grey))
      ],
    );
  }
}


class TextBody extends StatelessWidget {
  final String firstText;
  final String secondText;

  const TextBody({Key key, this.firstText, this.secondText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(firstText,style: TextStyle(fontWeight: FontWeight.bold,
        //fontSize: SizeConfig.blockVerticalSize * 2.3
        )),
        Spacer(),
        Text(secondText,style: TextStyle(
          fontWeight: FontWeight.bold,
          //fontSize: SizeConfig.blockVerticalSize * 2.3
          ))
      ],
    );
  }
}


