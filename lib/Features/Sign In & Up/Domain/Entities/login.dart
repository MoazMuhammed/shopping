import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/login_data.dart';

class Login {
  final bool status;
  final String message;
  final LoginData? data;

  Login({
    required this.status,
    required this.data,
    required this.message,
  });


  @override
  List<Object?> get props => [status, message, data];
}
