import 'package:shopping/Core/Network/API/endpoints.dart';
import 'package:shopping/Core/Network/API/my_dio.dart';
import 'package:shopping/Core/Network/Error%20Handling/exception.dart';
import 'package:shopping/Core/Network/Error%20Handling/network/error_message_network.dart';
import 'package:shopping/Features/Home%20Screen/Data/Models/home_model.dart';

abstract class BaseProductsRemoteDataSource{
  Future<HomeModel> getHomeProducts();
}

class ProductsRemoteDataSource extends BaseProductsRemoteDataSource{
  @override
  Future<HomeModel> getHomeProducts() async {
    final response = await MyDio.get(endPoint: EndPoints.getProducts);
    if (response!.statusCode == 200 ){
      print(response);
      return HomeModel.fromJson(response.data);
    } else{
      throw ServerException(errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }
  
}