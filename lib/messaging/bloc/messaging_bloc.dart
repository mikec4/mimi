import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MessagingBloc extends Bloc<MessagingEvent, MessagingState> {
  @override
  MessagingState get initialState => InitialMessagingState();

  @override
  Stream<MessagingState> mapEventToState(
    MessagingEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
