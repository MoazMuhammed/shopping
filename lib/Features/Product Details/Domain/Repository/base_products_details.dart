import 'package:dartz/dartz.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';
import 'package:shopping/Features/Product%20Details/Domain/Use%20Case/get_product_by_id_useCase.dart';

abstract class BaseProductsDetailsRepository{
  Future<Either<Failure,ProductsData>> getProductDetails(ProductID id);
}