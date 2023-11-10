import 'package:equatable/equatable.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/banners.dart';

import 'products_data.dart';

class Data extends Equatable {
  final List<ProductsData> productsData;

  const Data(this.productsData);

  @override
  List<Object> get props => [productsData];
}