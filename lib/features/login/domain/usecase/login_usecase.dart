import 'package:blindside/core/error/failures.dart';
import 'package:blindside/core/usecases/usecase.dart';
import 'package:blindside/features/login/domain/entity/login_entity.dart';
import 'package:blindside/features/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUsecase implements UseCase<User?, LoginParams> {
  final LoginRepository repository;

  LoginUsecase(this.repository);
  @override
  Future<Either<Failure, User?>> call(LoginParams params) async {
    return await repository.login(params.loginEntity);
  }
}

class LoginParams extends Equatable {
  final LoginEntity loginEntity;

  const LoginParams({required this.loginEntity});
  @override
  List<Object> get props => [loginEntity];
}
