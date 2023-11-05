part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.login,
    this.loginState = RequestState.isLoading,
    this.loginMessage = '',
  });

  final Login? login;
  final RequestState loginState;
  final String loginMessage;

  LoginState copyWith({
    Login? login,
    RequestState? loginState,
    String? message,

  }) {
    return LoginState(
      login: login ?? this.login,
      loginMessage: message ?? this.loginMessage,
      loginState: loginState ?? this.loginState,
    );
  }

  @override
  List<Object?> get props => [login, loginState, loginMessage];

}


