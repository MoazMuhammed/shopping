import 'package:dio/dio.dart';
import 'package:shopping/Core/Network/API/endpoints.dart';
import 'package:shopping/Core/Network/Error%20Handling/exception.dart';
import 'package:shopping/Core/Network/Error%20Handling/network/error_message_network.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Data/Models/signUp_model.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/UseCase/send_signUp.dart';

abstract class BaseSignUpRemoteDataSource{
  Future<SignUpModel> sendSignUp(SignUpParameters parameters);
}
class SignUpRemoteDataSource extends BaseSignUpRemoteDataSource{
  @override
  Future<SignUpModel> sendSignUp(SignUpParameters parameters) async {
    final response = await Dio().post(EndPoints.register,
        data:{
          "email": parameters.email,
          "name": parameters.name,
          "password": parameters.password,
          "phone": parameters.phone,
        });
    if(response.statusCode  == 200){
      print(response);
      return SignUpModel.fromJson(response.data);
    }else {
      throw ServerException(
          errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }
  
}