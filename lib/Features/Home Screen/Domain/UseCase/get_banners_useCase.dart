import 'package:dartz/dartz.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Core/useCase/base_usecase.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/banners.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Repository/base_home_repository.dart';

class GetBannersUseCase extends BaseUsecase<List<BannersData>,NoParameters>{
  final BaseHomeRepository baseHomeRepository;

  GetBannersUseCase(this.baseHomeRepository);

  @override
  Future<Either<Failure, List<BannersData>>> call(NoParameters parameters)async {
    return await baseHomeRepository.getBanners();
  }


}