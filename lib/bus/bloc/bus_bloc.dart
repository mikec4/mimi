import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BusBloc extends Bloc<BusEvent, BusState> {


  @override
  BusState get initialState => InitialBusState();

  @override
  Stream<BusState> mapEventToState(
    BusEvent event,
  ) async* {
    if(event is CreateBusEvent){
      yield LoadBusState();

      try {

        yield GetSelectedBusState(selectedBus: event.selectedBus);

      } catch (e) {
        
        yield ErrorBusState(message: e.toString());
      }
    }

    if(event is SelectSeatBusEvent){
      
      yield LoadBusState();

      try {
        final seats =   _selectSeat(event.selectedSeat);

        yield GetSelectedSeatBusState(selectedSeats: seats);

      } catch (e) {

        yield ErrorBusState(message: e.toString());

      }
    }
   
  }

 


  /* Select Seat here  */
  List<String>  _selectSeat(String seat)  {

    List<String> _selectedSeats = [];
    _selectedSeats.add(seat);

    return _selectedSeats;
  }

  
}
