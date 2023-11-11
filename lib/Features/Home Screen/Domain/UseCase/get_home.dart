import 'package:dartz/dartz.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Core/useCase/base_usecase.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/products_data.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Repository/base_home_repository.dart';

class GetHomeUseCase extends BaseUsecase<List<ProductsData>,NoParameters>{
  final BaseHomeRepository baseHomeRepository;

  GetHomeUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<ProductsData>>> call(NoParameters parameters) async{
    return await baseHomeRepository.getHome();
  }
}