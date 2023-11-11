import 'package:dartz/dartz.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';

abstract class BaseHomeRepository{
  Future<Either<Failure,List<ProductsData>>> getHome();
}