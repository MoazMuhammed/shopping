import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Core/useCase/base_usecase.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Repository/base_category_repository.dart';

class GetProductByCategoryUseCase
    extends BaseUsecase<List<ProductsData>, CategoryId> {
  final BaseCategoryRepository baseCategoryRepository;

  GetProductByCategoryUseCase(this.baseCategoryRepository);

  @override
  Future<Either<Failure, List<ProductsData>>> call(CategoryId parameters) async {
    return await baseCategoryRepository.getProductsByCategory(parameters);
  }
}

class CategoryId extends Equatable {
  final String id;

  const CategoryId({required this.id});

  @override
  List<Object> get props => [id];
}