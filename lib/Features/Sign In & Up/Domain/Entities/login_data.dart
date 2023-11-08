import 'package:equatable/equatable.dart';

class LoginData extends Equatable {
<<<<<<< HEAD
  final String name;
  final String phone;
  final String email;
  final int id;
  final String image;
  final String token;
=======
  final String? name;
  final String? phone;
  final String? email;
  final int? id;
  final String? image;
  final String? token;
>>>>>>> a2ee2ff (Initial commit)

  const LoginData({
    required this.name,
    required this.phone,
    required this.email,
    required this.id,
    required this.image,
    required this.token,
  });

  @override
<<<<<<< HEAD
  List<Object> get props => [name, phone, email, id, image, token];
=======
  List<Object?> get props => [name, phone, email, id, image, token];
>>>>>>> a2ee2ff (Initial commit)
}
