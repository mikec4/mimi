import 'package:dartz/dartz.dart';
import 'package:mimi/core/error/failures.dart';
import 'package:mimi/core/params/no_params.dart';
import 'package:mimi/core/usecases/use_cases.dart';
import 'package:mimi/features/domain/entities/user/user.dart';
import 'package:mimi/features/domain/repositories/user_repository.dart';



class CurrentUser extends UsesCases<User,NoParams>{

  final UserRepository userRepository;

  CurrentUser({this.userRepository}) : assert(userRepository != null);

  @override
  Future<Either<Failures, User>> call({NoParams params}) {
    return userRepository.currentUser();
  }

}