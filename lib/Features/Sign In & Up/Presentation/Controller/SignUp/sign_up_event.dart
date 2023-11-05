part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SendSignUpEvent extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  final String phone;

  const SendSignUpEvent(this.name, this.email, this.password, this.phone);

  @override
  List<Object> get props => [name, email, password, phone];

}
