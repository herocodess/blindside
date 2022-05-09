import 'package:blindside/core/error/failures.dart';
import 'package:blindside/features/register/domain/entity/register_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRepository {
  Future<Either<Failure, User?>> register(RegisterEntity registerEntity);
}
