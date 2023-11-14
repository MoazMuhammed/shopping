import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Core/useCase/base_usecase.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/category.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Repository/base_category_repository.dart';

class GetCategoryUseCase extends BaseUsecase<List<Categories>,NoParameters>{
  final BaseCategoryRepository baseCategoryRepository;

  GetCategoryUseCase(this.baseCategoryRepository);
  @override
  Future<Either<Failure, List<Categories>>> call(NoParameters parameters) async {
    return await baseCategoryRepository.getCategory();
  }

}