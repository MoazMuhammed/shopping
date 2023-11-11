import 'package:dio/dio.dart';
import 'package:shopping/Core/Network/API/endpoints.dart';
import 'package:shopping/Core/Network/API/my_dio.dart';
import 'package:shopping/Core/Network/Error%20Handling/exception.dart';
import 'package:shopping/Core/Network/Error%20Handling/network/error_message_network.dart';
import 'package:shopping/Features/Home%20Screen/Data/Models/home_model.dart';
import 'package:shopping/Features/Home%20Screen/Data/Models/products_data_model.dart';

abstract class BaseProductsRemoteDataSource{
  Future<List<ProductsDataModel>> getHomeProducts();
}

class ProductsRemoteDataSource extends BaseProductsRemoteDataSource{
  @override
  Future<List<ProductsDataModel>> getHomeProducts() async {
    final response = await Dio().get(EndPoints.getProducts);
    print(response);
    if (response.statusCode == 200 ){
      print(response);
      return List<ProductsDataModel>.from((response.data['data']['products']as List
      ).map((e) => ProductsDataModel.fromJson(e)));
    } else{
      throw ServerException(errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }
  
}