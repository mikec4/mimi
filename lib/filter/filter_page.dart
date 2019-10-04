import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mimi/filter/departue_time_check_box.dart';
import 'package:mimi/filter/travel_names_check_box.dart';
import 'package:mimi/searchResult/filter/filterProvider/filter_controller.dart';
import 'package:mimi/searchResult/pages/search_page.dart';
import 'package:mimi/searchResult/searchModel/search_bus.dart';
import 'package:provider/provider.dart';
import 'package:queries/collections.dart';

class FilterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterController>(
      builder: (context, controller, _) {
        return Scaffold(
          bottomSheet: CustomBottomButton(),
          appBar: AppBar(
            title: Text('Filter'),
        ),
          body: Column(
            children: <Widget>[
              FilterHeader(),
              TravelFilter(),
              Divider(),
              TimeFilter(),
              Divider(),
             // FilterRow(title: 'Boarding points',iconData: Icons.location_on,),
             // Divider(),
              //FilterRow(title: 'Dropping points',iconData: Icons.location_on,),
              //Divider()
            ],
          ),
        );
      }
    );
  }
}

class FilterHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0,bottom: 5.0,left: 10.0),
      alignment: Alignment.topLeft,
      color: Colors.grey[300],
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      child: Text(
        'FILTER BY',
         style: TextStyle(
         fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}

class FilterRow extends StatelessWidget {
  final IconData iconData;
  final String title;
  
  FilterRow({this.iconData,this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0,),
      child: Row(
        children: <Widget>[
          Icon(iconData,size: 25.0,),
          SizedBox(width: 5.0,),
          Text(title,style: TextStyle(fontSize: 15.0),),
          Spacer(), 
          IconButton(
            icon: Icon(MdiIcons.chevronDown),
            onPressed: (){
              _bottom(context);
            },
          )
        ],
      ),
    );
  }
  void _bottom(BuildContext context){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 10.0,
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      builder: (context){
        return Material(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            //color: Colors.greenAccent,
          ),
        );
      }
    );
  }
}



class CustomBottomButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterController>(
      builder: (context, controller,_) {
        return InkWell(
          onTap: (){
            // if(controller.departureTimes.length > 0  || controller.travelNames.length > 0){
            //   Navigator.pop(context);
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
            // }

          },
          child: Container(
            height: 45.0,
            alignment: Alignment.center,
            child: Text('DONE',style:TextStyle(color: Colors.white)),
            color: controller.departureTimes.length > 0 || controller.travelNames.length > 0 ? Theme.of(context).primaryColor : null,
          ),
        );
         
      }
    );
  }
}


class TravelFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterController>(
      builder: (context, controller, _) =>
       Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0,),
        child: Row(
          children: <Widget>[
            Icon(MdiIcons.bus,size: 25.0,color: controller.travelNames.length >= 1 ? Colors.greenAccent : Colors.black),
            SizedBox(width: 5.0,),
            Text('Travel',style: TextStyle(fontSize: 15.0),),
            Spacer(),
            IconButton(
              icon: Icon(MdiIcons.chevronDown,),
              onPressed: (){
                _bottom(context,controller);
              },
            )
          ],
        ),
      ),
    );
  }

  void _bottom(BuildContext context, FilterController controller){

    var busNames = _removeDuplicates(controller.buses);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 10.0,
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      builder: (context){
        return Material(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.separated(
              separatorBuilder: (_,i) => Divider(),
              itemCount: busNames.length,
              itemBuilder: (context, i){
                return TravelNamesCheckBox(title: busNames[i],id: i,);
              },
            ),
            //color: Colors.greenAccent,
          ),
        );
      }
    );
  }

  List<String> _removeDuplicates(List<SearchBus> buses){
    List<String> names = [];

    for(var bus in buses){
      names.add(bus.name);

    }
    var result = Collection(names).distinct().toList();
    return result;
  }

}



class TimeFilter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterController>(
      builder: (context, controller, _) =>
       Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0,),
        child: Row(
          children: <Widget>[
            Icon(MdiIcons.clockOutline,size: 25.0,color: controller.departureTimes.length >= 1 ? Colors.greenAccent : Colors.black,),
            SizedBox(width: 5.0,),
            Text('Time',style: TextStyle(fontSize: 15.0),),
            Spacer(),
            IconButton(
              icon: Icon(MdiIcons.chevronDown),
              onPressed: (){
                _bottom(context,controller);
              },
            )
          ],
        ),
      ),
    );
  }

  void _bottom(BuildContext context, FilterController controller){

    var departureTimes = _removeDuplicates(controller.buses);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 10.0,
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      builder: (context){
        return Material(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.separated(
              separatorBuilder: (_,i) => Divider(),
              itemCount: departureTimes.length,
              itemBuilder: (context, i){
                return DepartureTimeCheckBox(title: departureTimes[i],);
              },
            ),
            //color: Colors.greenAccent,
          ),
        );
      }
    );
  }

   List<String> _removeDuplicates(List<SearchBus> buses){
    List<String> departureTimes = [];

    for(var bus in buses){
      departureTimes.add(bus.departureTime);

    }
    var result = Collection(departureTimes).distinct().toList();
    return result;
  }
}




class BoardingPointsFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterController>(
      builder: (context, controller, _) =>
       Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0,),
        child: Row(
          children: <Widget>[
            Icon(Icons.location_on,size: 25.0,),
            SizedBox(width: 5.0,),
            Text('Boarding points',style: TextStyle(fontSize: 15.0),),
            Spacer(),
            IconButton(
              icon: Icon(MdiIcons.chevronDown),
              onPressed: (){
                _bottom(context,controller);
              },
            )
          ],
        ),
      ),
    );
  }

  void _bottom(BuildContext context, FilterController controller){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 10.0,
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      builder: (context){
        return Material(
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemCount: controller.buses.length,
              itemBuilder: (context, i){
                return ListTile(
                  title: Text(controller.buses[i].name),
                );
              },
            ),
            //color: Colors.greenAccent,
          ),
        );
      }
    );
  }
}
















