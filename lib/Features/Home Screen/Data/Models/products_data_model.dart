import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';

class ProductsDataModel extends ProductsData {
  ProductsDataModel({required super.id, required super.price, required super.oldPrice, required super.discount, required super.image, required super.name, required super.description, required super.images, required super.inFavorites, required super.inCart});

  factory ProductsDataModel.fromJson(Map<String, dynamic> json) {
        return ProductsDataModel(
              id: json['id'],
              price: json['price'],
              oldPrice: json['old_price'],
              discount: json['discount'],
              image: json['image'],
              name: json['name'],
              description: json['description'],
              images: List<String>.from(json['images']),
              inFavorites: json['in_favorites'],
              inCart: json['in_cart'],
        );
  }
}
