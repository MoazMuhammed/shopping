import 'package:get_it/get_it.dart';
import 'package:shopping/Features/Home%20Screen/Data/DataSource/peoducts_dataSource.dart';
import 'package:shopping/Features/Home%20Screen/Data/Repository/products_repository.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Repository/base_home_repository.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_home.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Controller/products_bloc.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Data/DataSource/login_dataSouce.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Data/DataSource/signUp_dataSource.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Data/Repository/login_repository.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Data/Repository/signUp_repository.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Repository/base_login_repository.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/Repository/base_sigUp_repository.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/UseCase/send_login.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Domain/UseCase/send_signUp.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Presentation/Controller/Login/login_bloc.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Presentation/Controller/SignUp/sign_up_bloc.dart';

final sl = GetIt.instance;
class ServiceLocator{
  void init(){
    sl.registerFactory(() => LoginBloc(sl()));
    sl.registerLazySingleton(() => SendLoginUseCase(sl()));
    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));
    sl.registerLazySingleton<BaseLoginRemoteDataSource>(() => LoginRemoteDataSource());

    sl.registerFactory(() => SignUpBloc(sl()));
    sl.registerLazySingleton(() => SendSignUpUseCase(sl()));
    sl.registerLazySingleton<BaseSignUpRepository>(() => SignUpRepository(sl()));
    sl.registerLazySingleton<BaseSignUpRemoteDataSource>(() => SignUpRemoteDataSource());


    sl.registerFactory(() => ProductsBloc(sl()));
    sl.registerLazySingleton(() => GetHome(sl()));
    sl.registerLazySingleton<BaseHomeRepository>(() => ProductsRepository(sl()));
    sl.registerLazySingleton<BaseProductsRemoteDataSource>(() => ProductsRemoteDataSource());

  }
}