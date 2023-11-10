import 'package:shopping/Features/Home%20Screen/Data/Models/products_data_model.dart';

class DataProductsModel {
  final List<ProductsDataModel> products;

  DataProductsModel(this.products);

  factory DataProductsModel.fromJson(Map<String, dynamic> json) {
    return DataProductsModel(List<ProductsDataModel>.from(json['products']
        .map((product) => ProductsDataModel.fromJson(product))));
  }
}
