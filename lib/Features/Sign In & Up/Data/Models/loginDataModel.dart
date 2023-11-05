import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/login_data.dart';

class LoginDataModel extends LoginData {
  const LoginDataModel(
      {required super.name,
      required super.phone,
      required super.email,
      required super.image,
      required super.token,
      required super.id});

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        image: json['image'],
        token: json['token'],
        id: json['id'],
      );
}
