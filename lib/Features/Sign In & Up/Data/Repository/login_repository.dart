import 'package:dartz/dartz.dart';
import 'package:shopping/Core/Network/Error%20Handling/exception.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Data/DataSource/login_dataSouce.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/login.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Repository/base_login_repository.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/UseCase/send_login.dart';

class LoginRepository extends BaseLoginRepository{
  final BaseLoginRemoteDataSource baseLoginRemoteDataSource;

  LoginRepository(this.baseLoginRemoteDataSource);

  @override
  Future<Either<Failure, Login>> sendLogin(LoginParameters parameters) async {
    final result = await baseLoginRemoteDataSource.sendLogin(parameters);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageNetwork.message));
    }

  }

}