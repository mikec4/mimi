import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserEntity extends Equatable{

  // final String verificationId;
  // final String error;
  // final FirebaseUser user;
  final String names;
  final String email;
  final String uid;
  final String mobileNumber;
  
  UserEntity({this.names,this.email,this.uid,this.mobileNumber});

}