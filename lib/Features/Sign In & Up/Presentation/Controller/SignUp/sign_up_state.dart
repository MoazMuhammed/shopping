part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.signUp,
    this.signUpState = RequestState.isLoading,
    this.signUpMessage = '',
  });

  final SignUp? signUp;
  final RequestState signUpState;
  final String signUpMessage;

  SignUpState copyWith({
    SignUp? signUp,
    RequestState? signUpState,
    String? signUpMessage,
  }) {
    return SignUpState(
      signUp: signUp ?? this.signUp,
      signUpMessage: signUpMessage ?? this.signUpMessage,
      signUpState: signUpState ?? this.signUpState,
    );
  }

  @override
  List<Object?> get props => [signUp, signUpState, signUpMessage];
}
