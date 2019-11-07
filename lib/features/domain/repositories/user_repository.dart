
import 'package:dartz/dartz.dart';
import 'package:mimi/core/error/failures.dart';
import 'package:mimi/features/domain/entities/user/user.dart';

abstract class UserRepository {
  Future<Either<Failures,User>> loginWithGoogle();
  Future<Either<Failures,User>> loginWithFacebook();
  Future<Either<Failures,User>> currentUser();
  //Future<Either<Failures,bool>> isLoggedIn();
}