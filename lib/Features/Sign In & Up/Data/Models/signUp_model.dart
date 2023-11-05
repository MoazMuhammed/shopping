import 'package:shopping/Features/Sign%20In%20&%20Up/Data/Models/signUpDataModel.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/signUp.dart';

class SignUpModel extends SignUp {
  SignUpModel(
      {required super.status, required super.message, required super.data});



  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return SignUpModel(status: false, data: null, message: "Invalid JSON data");
    }

    if (json['status'] is bool && json['data'] is Map<String, dynamic> && json['message'] is String) {
      return SignUpModel(
        status: json['status'],
        data: SignUpDataModel.fromJson(json['data']),
        message: json['message'],
      );

    } else {
      return SignUpModel(status: false, data: null, message: "Invalid JSON structure");
    }

  }

}
