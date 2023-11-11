import 'package:equatable/equatable.dart';

import 'products_data.dart';

class Data {
  final List<ProductsData> products;

  const Data(this.products);

  @override
  List<Object> get props => [products];
}