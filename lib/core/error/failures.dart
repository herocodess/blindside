import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

// General Failures
class ServerFailure extends Failure {
  @override
  List<Object> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => [];
}

class InternetFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ApiFailure extends Failure {
  final String message;
  const ApiFailure({required this.message});
  @override
  List<Object?> get props => [message];
}
