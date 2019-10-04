import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MessagingState extends Equatable {
  MessagingState([List props = const <dynamic>[]]) : super(props);
}

class InitialMessagingState extends MessagingState {
  @override
  String toString() {
    return 'Ininitial messaging state';
  }


}

class LoadMessaginState extends MessagingState{
  @override 
  String toString() => 'Load messaging state';
}


