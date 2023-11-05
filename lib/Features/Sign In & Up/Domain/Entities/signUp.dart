import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/signUpData.dart';

class SignUp {
  final bool status;
  final String message;
  final SignUpData? data;

  SignUp({
    required this.status,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}
