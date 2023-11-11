import 'package:shopping/Features/Home%20Screen/Data/Models/products_data_model.dart';

class DataProductsModel {
  final List<ProductsDataModel> products;

  DataProductsModel({required this.products});

  factory DataProductsModel.fromJson(Map<String, dynamic> json) {
    List<ProductsDataModel> productList = [];
    if (json['products'] != null) {
      json['products'].forEach((productJson) {
        productList.add(ProductsDataModel.fromJson(productJson));
      });
    }

    return DataProductsModel(products: productList);
  }
}
