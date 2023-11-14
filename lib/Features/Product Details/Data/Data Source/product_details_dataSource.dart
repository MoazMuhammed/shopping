import 'package:shopping/Core/Network/API/endpoints.dart';
import 'package:shopping/Core/Network/API/my_dio.dart';
import 'package:shopping/Core/Network/Error%20Handling/exception.dart';
import 'package:shopping/Core/Network/Error%20Handling/network/error_message_network.dart';
import 'package:shopping/Features/Home%20Screen/Data/Models/products_data_model.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';
import 'package:shopping/Features/Product%20Details/Domain/Use%20Case/get_product_by_id_useCase.dart';

abstract class BaseProductsDetailsRemoteDataSource{
  Future<ProductsData> getProductDetails(ProductID id);
}

class ProductsDetailsRemoteDataSource extends BaseProductsDetailsRemoteDataSource{
  @override
  Future<ProductsData> getProductDetails( ProductID id) async {
    final response = await MyDio.get(endPoint: '${EndPoints.getProductsDetailsWithID}${id.id}');
    if (response!.statusCode == 200 ){
      return ProductsDataModel.fromJson(response.data['data']);
    } else{
      throw ServerException(errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }
}