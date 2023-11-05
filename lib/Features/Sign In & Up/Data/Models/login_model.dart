import 'package:shopping/Features/Sign%20In%20&%20Up/Data/Models/loginDataModel.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/login.dart';

class LoginModel extends Login {
  LoginModel({
    required super.status,
    required super.data,
    required super.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return LoginModel(status: false, data: null, message: "Invalid JSON data");
    }

    if (json['status'] is bool && json['data'] is Map<String, dynamic> && json['message'] is String) {
      return LoginModel(
        status: json['status'],
        data: LoginDataModel.fromJson(json['data']),
        message: json['message'],
      );

    } else {
      return LoginModel(status: false, data: null, message: "Invalid JSON structure");
    }

  }

}
