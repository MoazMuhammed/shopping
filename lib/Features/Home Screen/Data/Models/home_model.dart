import 'package:shopping/Features/Home%20Screen/Domain/Entites/home.dart';

class HomeModel extends Home {
  HomeModel({required super.status, required super.data});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      HomeModel(status: json['status'], data: json['data']);
}
