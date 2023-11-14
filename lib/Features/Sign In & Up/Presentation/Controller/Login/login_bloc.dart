 import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/Core/Utills/Enum/enum.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/login.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/UseCase/send_login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.sendLoginUseCase) : super(const LoginState()) {
    on<SendLoginEvent>(sendLoginEvent);
  }

  final SendLoginUseCase sendLoginUseCase;

  FutureOr<void> sendLoginEvent(SendLoginEvent event, Emitter<LoginState> emit) async {
    final result = await sendLoginUseCase(LoginParameters(email: event.email, password: event.password));
    result.fold(
            (l) => emit(state.copyWith(
            loginState:RequestState.error,
            message: l.message)),
            (r) => emit(state.copyWith(
            login: r, loginState: RequestState.isLoaded)));
  }
}
