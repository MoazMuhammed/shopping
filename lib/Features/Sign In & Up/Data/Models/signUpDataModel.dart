import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/signUpData.dart';

class SignUpDataModel extends SignUpData {
  const SignUpDataModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.phone,
      required super.image,
      required super.token});

  factory SignUpDataModel.fromJson(Map<String, dynamic> json) =>
      SignUpDataModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        image: json['image'],
        token: json['token'],
      );
}
