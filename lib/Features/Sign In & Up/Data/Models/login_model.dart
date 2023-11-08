import 'package:shopping/Features/Sign%20In%20&%20Up/Data/Models/loginDataModel.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/login.dart';

class LoginModel extends Login {
  LoginModel({
    required super.status,
    required super.data,
    required super.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
      return LoginModel(
        status: json['status'] ?? false,
        data: json['data'] != null ? LoginDataModel.fromJson(json['data']) : null,
        message: json['message'] ?? '',
      );

    }
  }

