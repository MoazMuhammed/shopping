import 'package:dartz/dartz.dart';
import 'package:shopping/Core/Network/Error%20Handling/exception.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Features/Product%20Details/Data/Data%20Source/product_details_dataSource.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';
import 'package:shopping/Features/Product%20Details/Domain/Repository/base_products_details.dart';
import 'package:shopping/Features/Product%20Details/Domain/Use%20Case/get_product_by_id_useCase.dart';

class ProductRepository extends BaseProductsDetailsRepository {
  final BaseProductsDetailsRemoteDataSource baseProductsDetailsRemoteDataSource;

  ProductRepository(this.baseProductsDetailsRemoteDataSource);

  @override
  Future<Either<Failure, ProductsData>> getProductDetails(ProductID id) async {
    final result =
        await baseProductsDetailsRemoteDataSource.getProductDetails(id);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageNetwork.message));
    }
  }
}
