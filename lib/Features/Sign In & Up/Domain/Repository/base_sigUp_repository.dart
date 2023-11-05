import 'package:dartz/dartz.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/signUp.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/UseCase/send_signUp.dart';

abstract class BaseSignUpRepository{
  Future<Either<Failure,SignUp>> sendSignUp(SignUpParameters parameters);
}