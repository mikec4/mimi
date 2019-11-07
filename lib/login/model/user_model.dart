import 'package:firebase_auth/firebase_auth.dart';
import 'package:mimi/login/loginEntity/user.dart';

class UserModel extends User{

  final String names;
  final String email;
  final String uid;
  final String mobileNumber;

  UserModel({
    this.names, 
    this.email, 
    this.uid,
    this.mobileNumber
    }) : super(names: names,email: email,uid: uid,mobileNumber:mobileNumber);

  factory UserModel.fromFirebase(FirebaseUser user){
    return UserModel(
      email: user.email,
      names: user.displayName,
      mobileNumber: user.phoneNumber,
      uid: user.uid
    );
  }

}