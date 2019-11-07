import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/flutter_skeleton.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mimi/amenities/bloc/bloc.dart';
import 'package:mimi/bus/bloc/bloc.dart';
import 'package:mimi/bus/bloc/bus_bloc.dart';
import 'package:mimi/bus/busProvider/bus_controller.dart';
import 'package:mimi/bus/pages/bus_page.dart';
import 'package:mimi/filter/filter_page.dart';
import 'package:mimi/global/route_title.dart';
import 'package:mimi/home/homeProvider/home_provider.dart';
import 'package:mimi/policy/bloc/bloc.dart';
import 'package:mimi/policy/bloc/policies_bloc.dart';
import 'package:mimi/searchResult/bloc/bloc.dart';
import 'package:mimi/searchResult/filter/filterProvider/filter_controller.dart';
import 'package:mimi/searchResult/pages/filter_model.dart';
import 'package:mimi/searchResult/searchModel/search_bus.dart';
import 'package:mimi/seat/bloc/bloc.dart';
import 'package:mimi/seat/bloc/seat_bloc.dart';
import 'package:mimi/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../custom_bus_card.dart';

List<SearchBus> _buses = [];


class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  HomeProvider _homeProvider;
  
  void _initiProviders() async{
    
    _homeProvider = Provider.of<HomeProvider>(context);
  }


  @override
  Widget build(BuildContext context) {

    _initiProviders();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: CustomFilterButton(),
      appBar: AppBar(
        centerTitle: true,
       elevation: 0.0,
        title: RoutesTitle()
      ),
      body: Column(
        
        children: <Widget>[
         // DateHeader(dateTime: _homeProvider.date,),
          CustomDateTimeLine(),
          SearchBody()
        ],
      ),
    );
  }


}
 


class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  BlocListener<SearchBloc,SearchState>(
      listener: (context,state){
        if(state is BusesSearchState){

        Scaffold.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.fixed,
            content: Container(
              height: 25.0,
              child: Center(
                child: Text(
                  '${state.searchBusList.buses.length} Buses found',
                  style: TextStyle(fontSize: SizeConfig.blockVerticalSize * 2.16,fontWeight: FontWeight.w600,fontFamily: 'NotoSerif'),)
                  )
                ),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.greenAccent,

                )
              );
            }

            },
            child: BlocBuilder<SearchBloc,SearchState>(
              builder: (context,state){
                if(state is EmptySearchState) return _emptyValues();
                //if(state is LoadSearchState) return _loader(context);
                if(state is LoadSearchState) return SkeletonSearch();
                if(state is ErrorSearchState) return _errorWidget(state.message);
                if(state is BusesSearchState) {
                 // return CustomCardList( buses: state.searchBusList.buses,);
                 if(state.searchBusList.buses.length != 0){
                  _buses = state.searchBusList.buses;
                 
                  return SearchPageFilter(buses: state.searchBusList.buses,);

                }else {
                  return SkeletonSearch();
                }

                 
          }
        },
      ),
    );
  }

  Widget _loader(BuildContext context){
    return Material(
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
       // color: Colors.white,
        //alignment: Alignment(0.0,2.0),
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _errorWidget(String error){
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Text(error),
    );
  }

  Widget _emptyValues(){
  return Container(
    alignment: Alignment.center,
    child: Text('No data available here please'),
  );
 }



}


class CustomShimmer extends StatelessWidget {
  const CustomShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
       itemBuilder: (context,i){

         return Shimmer.fromColors(
           child: CustomBusCard(),
           baseColor: Colors.grey[300],
           highlightColor: Colors.white,
           period: Duration(seconds: 10),
         );
       },
      ),
    );
  }
}

class SkeletonSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardListSkeleton(
        length: 5,
        style: SkeletonStyle(
          backgroundColor: Colors.grey[300],
          isAnimation: true,
          isCircleAvatar: false,
          isShowAvatar: false,
          barCount: 2,
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}


class SearchPageFilter extends StatelessWidget {
  final List<SearchBus> buses;
  

  const SearchPageFilter({Key key, this.buses}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterController>(
      builder: (context, controller, _){
        final _filter = FilterModel();

        if(controller.departureTimes.length > 0 && controller.travelNames.length == 0){
          var _departureTimes = _filter.filterDepartureTimes(buses, controller.departureTimes);
          return CustomCardList(buses: _departureTimes,);
        }
        else if(controller.travelNames.length > 0 && controller.departureTimes.length == 0){
          var _travelNames = _filter.filterNames(buses, controller.travelNames);
          return CustomCardList(buses: _travelNames,);
        }
        else if(controller.travelNames.length > 0 && controller.departureTimes.length > 0){
          var _both = _filter.filterByDepartureTimeAndTravelNames(buses, controller.departureTimes, controller.travelNames);
          return CustomCardList(buses: _both,);
        }
        else {
          return CustomCardList(buses:  buses,);
        }
      },
    );
  }


}


class CustomCardList extends StatefulWidget {

  final List<SearchBus> buses;

  const CustomCardList({Key key, this.buses,}) : super(key: key);

  @override
  _CustomCardListState createState() => _CustomCardListState();
}

class _CustomCardListState extends State<CustomCardList> {
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Scrollbar(
        child: ListView.builder(
         // padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
         padding: EdgeInsets.symmetric(
           vertical: SizeConfig.blockVerticalSize * 2.0,horizontal: SizeConfig.blockHorizontalSize * 1.2),
          itemCount: widget.buses.length,
         // itemExtent: 124.0,
         itemExtent: SizeConfig.blockVerticalSize * 16.0,
          itemBuilder: (_,i){
            
            return Padding(
              padding:  EdgeInsets.all(SizeConfig.blockHorizontalSize),
              child: InkWell(
                onTap: () async {
         
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BusPage()));

                  Provider.of<BusController>(context).resetSeats();
                  Provider.of<BusController>(context).setBusId = widget.buses[i].id;
                  
                  BlocProvider.of<BusBloc>(context).add(CreateBusEvent(selectedBus: widget.buses[i]));
                  BlocProvider.of<AmenitiesBloc>(context).add(FetchAllAmenitiesEvent(busId: widget.buses[i].id));
                  BlocProvider.of<PoliciesBloc>(context).add(FetchAllPoliciesEvent(busId: widget.buses[i].id));
                  BlocProvider.of<SeatBloc>(context).add(FetchAllSeatEvent(busId: widget.buses[i].id));

                },
                child: CustomBusCard(
                  busName: widget.buses[i].name,
                  fare: widget.buses[i].fare,
                  busType: widget.buses[i].busType,
                  departureTime: widget.buses[i].departureTime,
                  arriveTime: widget.buses[i].arriveTime,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



class CustomDateTimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context,model,_){
        return Container(
          width: MediaQuery.of(context).size.width,
          height: SizeConfig.blockVerticalSize * 10.3, 
          color: Colors.orangeAccent,
          child: DatePickerTimeline(
            model.date,
            onDateChange: (dt){

              Map<String,dynamic> route = {
               "From": model.originalLocation,
               "To": model.destination
                };


              BlocProvider.of<SearchBloc>(context).add(SearchByName(dateTime: dt,route: route));
              model.setDate(dt);
            },
          ),
        );
      },
    );
  }
}


class CustomFilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FilterController>(
      builder: (context,controller,_){
        return FloatingActionButton(
          child: Icon(controller.departureTimes.length > 0 || controller.travelNames.length > 0 ? MdiIcons.filterPlus: MdiIcons.filterPlusOutline),
          onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (_)=> FilterPage()));

            if(_buses.length != 0){
              controller.setBuses = _buses;
            }
          },
        );
      },
    );
    
  }


}















