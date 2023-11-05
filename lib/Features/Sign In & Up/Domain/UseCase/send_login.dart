import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Core/useCase/base_usecase.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/login.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Repository/base_login_repository.dart';

class SendLoginUseCase extends BaseUsecase<Login, LoginParameters> {
  final BaseLoginRepository baseLoginRepository;

  SendLoginUseCase(this.baseLoginRepository);

  @override
  Future<Either<Failure, Login>> call(LoginParameters parameters) async {
    return await baseLoginRepository.sendLogin(parameters);
  }
}

class LoginParameters extends Equatable {
  final String email;
  final String password;

  const LoginParameters({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}