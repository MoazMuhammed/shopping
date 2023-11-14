import 'package:shopping/Features/Home%20Screen/Domain/Entites/banners.dart';

class BannersModel extends BannersData{
  BannersModel(super.id, super.image);
  factory BannersModel.fromJson(Map<String,dynamic> json) =>
      BannersModel(json['id'], json['image']);
}