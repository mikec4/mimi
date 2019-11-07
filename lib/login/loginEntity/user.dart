import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable{

  final String names;
  final String email;
  final String uid;
  final String mobileNumber;

  User({
    @required this.names,
    @required this.email, 
    @required this.uid, 
    @required this.mobileNumber
    });

  @override 
  List<Object> get props => [names,email,uid,mobileNumber];

}