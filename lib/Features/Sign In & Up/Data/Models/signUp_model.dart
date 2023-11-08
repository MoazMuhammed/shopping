import 'package:shopping/Features/Sign%20In%20&%20Up/Data/Models/signUpDataModel.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/signUp.dart';

class SignUpModel extends SignUp {
  SignUpModel(
      {required super.status, required super.message, required super.data});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      status: json['status'] ?? false, // Provide a default value if 'status' is missing
      message: json['message'] ?? "No message available", // Provide a default message
      data: json['data'] != null ? SignUpDataModel.fromJson(json['data']) : null,
    );
  }
}
