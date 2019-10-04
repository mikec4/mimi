import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MessagingEvent extends Equatable {
  MessagingEvent([List props = const <dynamic>[]]) : super(props);
}

class ConfigureMessagingEvent extends MessagingEvent{
  
  @override
  String toString() => 'Configure message event';
  
  
}