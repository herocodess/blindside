import 'package:blindside/core/error/failures.dart';
import 'package:blindside/features/login/domain/entity/login_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<Either<Failure, User?>> login(LoginEntity loginEntity);
}
