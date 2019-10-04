import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/searchResult/bloc/bloc.dart';
import 'package:mimi/seat/model/seatList.dart';
import 'package:mimi/seat/repository/seat_repository.dart';
import './bloc.dart';

class SeatBloc extends Bloc<SeatEvent, SeatState> {

  final _seatRepository = SeatRepository();

  @override
  SeatState get initialState => InitialSeatState();

  @override
  Stream<SeatState> mapEventToState(
    SeatEvent event,
  ) async* {

    if(event is FetchAllSeatEvent){
    
      yield LoadSeatState();
      
      try {
        final snapshots = await _seatRepository.getAllSeats(event.busId);
        final seatList = SeatList.fromSnapshots(snapshots);

        yield ListSeatState(seats: seatList.seats);

      } catch (e) {

        yield ErrorSeatState(
          message: e.toString()
        );
      }
    }
  }
}
