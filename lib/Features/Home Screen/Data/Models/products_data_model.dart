import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';

class ProductsDataModel extends ProductsData {
  ProductsDataModel(super.id,
      super.price,
      super.old_price,
      super.discount,
      super.image,
      super.name,
      super.describtion,
      super.in_favorites,
      super.in_cart);

  factory ProductsDataModel.fromJson(Map<String, dynamic> json) =>
      ProductsDataModel(
        json['id'],
        json['price'],
        json['old_price'],
        json['discount'],
        json['image'],
        json['name'],
        json['describtion'],
        json['in_favorites'],
        json['in_cart'],);
}
