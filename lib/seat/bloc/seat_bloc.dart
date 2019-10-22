import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mimi/seat/repository/seat_repository_impl.dart';
import './bloc.dart';

class SeatBloc extends Bloc<SeatEvent, SeatState> {

  final SeatRepositoryImpl _seatRepository;
  
  SeatBloc({SeatRepositoryImpl seatRepositoryImpl}) : 
  _seatRepository = seatRepositoryImpl ?? SeatRepositoryImpl();

  @override
  SeatState get initialState => LoadSeatState();

  @override
  Stream<SeatState> mapEventToState(
    SeatEvent event,
  ) async* {

    if(event is FetchAllSeatEvent){
    
      yield LoadSeatState();
      
      // try {
      //   final snapshots = await _seatRepository.getAllSeats(event.busId);
      //   final seatList = SeatList.fromSnapshots(snapshots);

      //   yield ListSeatState(seats: seatList.seats);

      // } catch (e) {

      //   yield e is ErrorSeatState ? ErrorSeatState(message: e.message) : ErrorSeatState(message: 'Not server error');

      // }
      var eitherResults = await _seatRepository.getSeats(event.busId);
      
      yield* eitherResults.fold(
        (failure) async*{
          yield LoadSeatState();
          yield ErrorSeatState(message: failure.failure);
        }, 
        (seatList) async*{
          yield ListSeatState(seats: seatList.seats);
        });
    }
  }
}
