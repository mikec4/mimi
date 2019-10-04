import 'package:firebase_auth/firebase_auth.dart';

class UserEntity{

  final String verificationId;
  final String error;
  final FirebaseUser user;
  
  UserEntity({this.user,this.error,this.verificationId});

}