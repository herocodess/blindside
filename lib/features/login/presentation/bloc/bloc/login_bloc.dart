import 'package:blindside/core/helpers/helper.dart';
import 'package:blindside/features/login/domain/entity/login_entity.dart';
import 'package:blindside/features/login/domain/usecase/login_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc({required this.loginUsecase}) : super(LoginInitial()) {
    on<LoginUserEvent>((event, emit) async {
      emit(LoginLoading());
      final failureOrLogin =
          await loginUsecase.call(LoginParams(loginEntity: event.entity));
      failureOrLogin.fold(
          (l) => emit(LoginFailure(exception: Helper.mapFailureToMessage(l))),
          (r) => emit(LoginSuccess(user: r)));
    });
  }
}
