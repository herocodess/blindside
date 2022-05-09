import 'package:blindside/core/error/failures.dart';
import 'package:blindside/core/network/network_info.dart';
import 'package:blindside/features/login/data/datasource/login_datasource.dart';
import 'package:blindside/features/login/domain/entity/login_entity.dart';
import 'package:blindside/features/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({required this.dataSource, required this.networkInfo});
  @override
  Future<Either<Failure, User?>> login(LoginEntity loginEntity) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await dataSource.login(loginEntity);
        return Right(remoteData);
      } on FirebaseException catch (e) {
        return Left(ApiFailure(message: e.message!));
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
