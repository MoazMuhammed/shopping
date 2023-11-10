import 'package:equatable/equatable.dart';

class ProductsData extends Equatable {
  final int id;
  final int price;
  final int old_price;
  final int discount;
  final String image;
  final String name;
  final String describtion;
  final bool in_favorites;
  final bool in_cart;

  ProductsData(this.id, this.price, this.old_price, this.discount, this.image,
      this.name, this.describtion, this.in_favorites, this.in_cart);

  @override
  List<Object> get props =>
      [
        id,
        price,
        old_price,
        discount,
        image,
        name,
        describtion,
        in_favorites,
        in_cart,
      ];
}