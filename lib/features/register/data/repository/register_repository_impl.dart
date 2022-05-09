import 'package:blindside/core/error/failures.dart';
import 'package:blindside/core/network/network_info.dart';
import 'package:blindside/features/register/data/datasource/register_datasource.dart';
import 'package:blindside/features/register/domain/entity/register_entity.dart';
import 'package:blindside/features/register/domain/repository/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource dataSource;
  final NetworkInfo networkInfo;

  RegisterRepositoryImpl({required this.dataSource, required this.networkInfo});
  @override
  Future<Either<Failure, User?>> register(RegisterEntity loginEntity) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await dataSource.register(loginEntity);
        return Right(remoteData);
      } on FirebaseException catch (e) {
        return Left(ApiFailure(message: e.message!));
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
