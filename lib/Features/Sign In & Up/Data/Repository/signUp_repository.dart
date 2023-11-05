import 'package:dartz/dartz.dart';
import 'package:shopping/Core/Network/Error%20Handling/exception.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Data/DataSource/signUp_dataSource.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/signUp.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Repository/base_sigUp_repository.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/UseCase/send_signUp.dart';

class SignUpRepository extends BaseSignUpRepository {
  final BaseSignUpRemoteDataSource baseSignUpRemoteDataSource;

  SignUpRepository(this.baseSignUpRemoteDataSource);

  @override
  Future<Either<Failure, SignUp>> sendSignUp(
      SignUpParameters parameters) async {
    final result = await baseSignUpRemoteDataSource.sendSignUp(parameters);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageNetwork.message));
    }
  }
}
