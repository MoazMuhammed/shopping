import 'package:dio/dio.dart';
import 'package:shopping/Core/Network/API/endpoints.dart';
import 'package:shopping/Core/Network/API/my_dio.dart';
import 'package:shopping/Core/Network/Error%20Handling/exception.dart';
import 'package:shopping/Core/Network/Error%20Handling/network/error_message_network.dart';
import 'package:shopping/Core/Utills/Shared%20Preferences/my_shared.dart';
import 'package:shopping/Core/Utills/Shared%20Preferences/my_shared_keys.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Data/Models/login_model.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/UseCase/send_login.dart';

abstract class BaseLoginRemoteDataSource{
  Future<LoginModel> sendLogin(LoginParameters parameters);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource{
  @override
  Future<LoginModel> sendLogin(LoginParameters parameters) async {
    final response = await MyDio.post(endPoint: EndPoints.login,   data:{
      "email": parameters.email,
      "password": parameters.password,
    });
    if(response!.data['status']  == true){
      print(response);
    return LoginModel.fromJson(response.data);
    }else {
    throw ServerException(
          errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }

}