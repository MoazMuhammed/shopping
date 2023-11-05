import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Core/useCase/base_usecase.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/signUp.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Repository/base_sigUp_repository.dart';

class SendSignUpUseCase extends BaseUsecase<SignUp, SignUpParameters> {
  final BaseSignUpRepository baseSignUpRepository;

  SendSignUpUseCase(this.baseSignUpRepository);

  @override
  Future<Either<Failure, SignUp>> call(SignUpParameters parameters) async {
    return await baseSignUpRepository.sendSignUp(parameters);
  }
}

class SignUpParameters extends Equatable{
  final String name;
  final String email;
  final String password;
  final String phone;

  const SignUpParameters({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object> get props => [
        name,
        email,
    password,
    phone,
      ];
}
