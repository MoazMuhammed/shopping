import 'package:equatable/equatable.dart';

class LoginData extends Equatable {
  final String name;
  final String phone;
  final String email;
  final int id;
  final String image;
  final String token;

  const LoginData({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.token,
  });

  @override
  List<Object> get props => [name, phone, email, id, image, token];
}
