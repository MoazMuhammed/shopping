import 'package:shopping/Features/Home%20Screen/Domain/Entites/data.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/home.dart';

class HomeModel extends Home{
  HomeModel(super.status, super.data , super.message);
  factory HomeModel.fromJson(Map<String,dynamic> json) => HomeModel(json['status'],
      json['data'],json['message'] == null ? '' : '');

}