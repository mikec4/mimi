import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable{
  Failures();
}

class ServerFailures extends Failures{
 final String error;
 ServerFailures({this.error});
 @override 
 List<Object> get props => [error];
}

class CacheFailures extends Failures{

  @override 
  List<Object> get props => [];
}

