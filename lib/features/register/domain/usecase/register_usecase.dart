import 'package:blindside/core/error/failures.dart';
import 'package:blindside/core/usecases/usecase.dart';
import 'package:blindside/features/register/domain/entity/register_entity.dart';
import 'package:blindside/features/register/domain/repository/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUseCase implements UseCase<User?, RegisterParams> {
  final RegisterRepository repository;

  RegisterUseCase(this.repository);
  @override
  Future<Either<Failure, User?>> call(RegisterParams params) async {
    return await repository.register(params.registerEntity);
  }
}

class RegisterParams extends Equatable {
  final RegisterEntity registerEntity;

  const RegisterParams({required this.registerEntity});
  @override
  List<Object> get props => [registerEntity];
}
