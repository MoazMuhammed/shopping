import 'package:dartz/dartz.dart';
import 'package:shopping/Core/Network/Error%20Handling/failure.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Entites/home.dart';

abstract class BaseHomeRepository{
  Future<Either<Failure,Home>> getHome();
}