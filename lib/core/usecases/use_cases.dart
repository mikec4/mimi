import 'package:dartz/dartz.dart';
import 'package:mimi/core/error/failures.dart';

abstract class UsesCases<Type,Params> {
  Future<Either<Failures,Type>> call({Params params});
}