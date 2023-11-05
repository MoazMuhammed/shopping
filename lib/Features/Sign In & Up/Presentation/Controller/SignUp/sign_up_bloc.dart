import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/Core/Utills/Enum/enum.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/signUp.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/UseCase/send_signUp.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this.sendSignUpUseCase) : super(const SignUpState()) {
    on<SendSignUpEvent>(sendSignUpEvent);
  }

  final SendSignUpUseCase sendSignUpUseCase;

  FutureOr<void> sendSignUpEvent(SendSignUpEvent event, Emitter<SignUpState> emit) async {
    final result = await sendSignUpUseCase(SignUpParameters(name: event.name, email: event.email, password: event.password, phone: event.phone));
    result.fold(
            (l) => emit(state.copyWith(
            signUpState:RequestState.error,
            signUpMessage: l.message)),
            (r) => emit(state.copyWith(
            signUp: r, signUpState: RequestState.isLoaded)));
  }
}


