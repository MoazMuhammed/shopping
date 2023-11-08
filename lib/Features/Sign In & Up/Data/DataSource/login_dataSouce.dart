import 'package:dio/dio.dart';
import 'package:shopping/Core/Network/API/endpoints.dart';
import 'package:shopping/Core/Network/Error%20Handling/exception.dart';
import 'package:shopping/Core/Network/Error%20Handling/network/error_message_network.dart';
<<<<<<< HEAD
=======
import 'package:shopping/Core/Utills/Shared%20Preferences/my_shared.dart';
import 'package:shopping/Core/Utills/Shared%20Preferences/my_shared_keys.dart';
>>>>>>> a2ee2ff (Initial commit)
import 'package:shopping/Features/Sign%20In%20&%20Up/Data/Models/login_model.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/UseCase/send_login.dart';

abstract class BaseLoginRemoteDataSource{
  Future<LoginModel> sendLogin(LoginParameters parameters);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource{
  @override
  Future<LoginModel> sendLogin(LoginParameters parameters) async {
    final response = await Dio().post(EndPoints.login,
        data:{
          "email": parameters.email,
          "password": parameters.password,
        } );
<<<<<<< HEAD
    if(response.data['status']  == true){
      print(response);
    return LoginModel.fromJson(response.data);
=======
    if(response.statusCode  == 200){
      print(response);
      return LoginModel.fromJson(response.data);
>>>>>>> a2ee2ff (Initial commit)
    }else {
    throw ServerException(
          errorMessageNetwork: ErrorMessageNetwork.fromJson(response.data));
    }
  }

}