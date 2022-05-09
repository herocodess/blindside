import 'package:blindside/core/helpers/helper.dart';
import 'package:blindside/features/register/domain/entity/register_entity.dart';
import 'package:blindside/features/register/domain/usecase/register_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterBloc({required this.registerUseCase}) : super(RegisterInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoading());
      final failureOrRegister = await registerUseCase
          .call(RegisterParams(registerEntity: event.entity));
      failureOrRegister.fold(
          (l) =>
              emit(RegisterFailure(exception: Helper.mapFailureToMessage(l))),
          (r) => emit(RegisterSuccess(user: r)));
    });
  }
}
