import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/category.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_product_by_category_useCase.dart';

abstract class BaseCategoryRepository{
  Future<Either<Failure,List<Categories>>> getCategory();
  Future<Either<Failure,List<ProductsData>>> getProductsByCategory(CategoryId parameters);
}