import 'package:dartz/dartz.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Entities/login.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/UseCase/send_login.dart';

abstract class BaseLoginRepository{
  Future<Either<Failure,Login>> sendLogin(LoginParameters parameters);
}