import 'package:dartz/dartz.dart';
import 'package:shopping/Core/Network/Error%20Handling/exception.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Features/Home%20Screen/Data/DataSource/category_dataSource.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/category.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Repository/base_category_repository.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_product_by_category_useCase.dart';

class CategoryRepository extends BaseCategoryRepository{
  final BaseCategoryRemoteDateSource baseCategoryRemoteDateSource;

  CategoryRepository(this.baseCategoryRemoteDateSource);

  @override
  Future<Either<Failure, List<Categories>>> getCategory() async {
    final result = await baseCategoryRemoteDateSource.getCategories();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageNetwork.message));
    }
  }

  @override
  Future<Either<Failure, List<ProductsData>>> getProductsByCategory(CategoryId parameters) async {
    final result = await baseCategoryRemoteDateSource.getProductByCategory(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageNetwork.message));
    }
  }


}