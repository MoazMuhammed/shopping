import 'package:dartz/dartz.dart';
import 'package:shopping/Core/Network/Error%20Handling/exception.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Features/Home%20Screen/Data/DataSource/peoducts_dataSource.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/home.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Repository/base_home_repository.dart';

class ProductsRepository extends BaseHomeRepository {
  final BaseProductsRemoteDataSource baseProductsRemoteDataSource;

  ProductsRepository(this.baseProductsRemoteDataSource);

  @override
  Future<Either<Failure, Home>> getHome() async {
    final result = await baseProductsRemoteDataSource.getHomeProducts();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageNetwork.message));
    }
  }
}
