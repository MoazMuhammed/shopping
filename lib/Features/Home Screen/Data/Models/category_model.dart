
import 'package:shopping/Features/Home%20Screen/Domain/Entites/category.dart';

class CategoryModel extends Categories{
  CategoryModel({required super.id, required super.categoryName, required super.categoryImage});

  factory CategoryModel.fromJson(Map<String,dynamic> json) => CategoryModel(id: json['id'],
      categoryName: json['name'],
      categoryImage: json['image']);

}