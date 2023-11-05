import 'package:equatable/equatable.dart';

class SignUpData extends Equatable{
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;

  const SignUpData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });

  @override
  List<Object> get props => [
        id,
        name,
        email,
        phone,
        image,
        token,
      ];
}
