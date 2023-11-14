import 'package:shopping/Core/Network/API/endpoints.dart';
import 'package:shopping/Core/Network/API/my_dio.dart';
import 'package:shopping/Core/Network/Error%20Handling/exception.dart';
import 'package:shopping/Core/Network/Error%20Handling/network/error_message_network.dart';
import 'package:shopping/Features/Home%20Screen/Data/Models/category_model.dart';
import 'package:shopping/Features/Home%20Screen/Data/Models/products_data_model.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/category.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_product_by_category_useCase.dart';

abstract class BaseCategoryRemoteDateSource{
  Future<List<Categories>> getCategories();
  Future<List<ProductsData>> getProductByCategory(CategoryId parameters);
}

class CategoryRemoteDateSource extends BaseCategoryRemoteDateSource{
  @override
  Future<List<Categories>> getCategories() async {
    final response = await MyDio.get(endPoint: EndPoints.getCategories);
    if (response!.statusCode == 200 ){
      print(response);
      return List<CategoryModel>.from((response.data['data']['data']as List
      ).map((e) => CategoryModel.fromJson(e)));
    } else{
      throw ServerException(errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }

  }

  @override
  Future<List<ProductsData>> getProductByCategory(CategoryId parameters) async {
    final response = await MyDio.get(endPoint: '${EndPoints.getCategoriesWithID}${parameters.id}');
    if (response!.statusCode == 200 ){
      print("products of category ====> $response");
      return List<ProductsDataModel>.from((response.data['data']['data']as List
      ).map((e) => ProductsDataModel.fromJson(e)));
    } else{
      throw ServerException(errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }


}