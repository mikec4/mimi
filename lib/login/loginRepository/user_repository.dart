
import 'package:dartz/dartz.dart';
import 'package:mimi/failure/failure.dart';
import 'package:mimi/login/model/user_model.dart';

abstract class UserRepository{

  Future<dynamic> signInWithGoogle();

  Future<dynamic> facebookSignIn();

  Future<void> signOut();

  Future<bool> isSignedIn();

  Future<String> getUserEmail();

  Future<bool> isFacebookLoggedIn();

  Future<Either<Failure,UserModel>> loginInWithGoogle();
  Future<Either<Failure,UserModel>> loginInWithFacebook();
  Future<Either<Failure,UserModel>> currentUser();
  Future<Either<Failure,bool>> isLoggedIn();

}