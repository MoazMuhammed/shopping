import 'package:get_it/get_it.dart';
import 'package:shopping/Features/Home%20Screen/Data/DataSource/category_dataSource.dart';
import 'package:shopping/Features/Home%20Screen/Data/DataSource/peoducts_dataSource.dart';
import 'package:shopping/Features/Product%20Details/Data/Data%20Source/product_details_dataSource.dart';
import 'package:shopping/Features/Home%20Screen/Data/Repository/category_repository.dart';
import 'package:shopping/Features/Product%20Details/Data/Repository/product_details_repository.dart';
import 'package:shopping/Features/Home%20Screen/Data/Repository/products_repository.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Repository/base_category_repository.dart';
import 'package:shopping/Features/Home%20Screen/Domain/Repository/base_home_repository.dart';
import 'package:shopping/Features/Product%20Details/Domain/Repository/base_products_details.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_banners_useCase.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_category_useCase.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_home.dart';
import 'package:shopping/Features/Home%20Screen/Domain/UseCase/get_product_by_category_useCase.dart';
import 'package:shopping/Features/Product%20Details/Domain/Use%20Case/get_product_by_id_useCase.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Controller/Category/category_bloc.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/Controller/products_bloc.dart';
import 'package:shopping/Features/Product%20Details/Presentation/Controller/Product%20Details%20By%20Id/product_details_by_id_bloc.dart';
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


    sl.registerFactory(() => ProductsBloc(sl(),sl()));
    sl.registerLazySingleton(() => GetHomeUseCase(sl()));
    sl.registerLazySingleton(() => GetBannersUseCase(sl()));
    sl.registerLazySingleton<BaseHomeRepository>(() => ProductsRepository(sl()));
    sl.registerLazySingleton<BaseProductsRemoteDataSource>(() => ProductsRemoteDataSource());

    sl.registerFactory(() => CategoryBloc(sl(),sl()));
    sl.registerLazySingleton(() => GetCategoryUseCase(sl()));
    sl.registerLazySingleton(() => GetProductByCategoryUseCase(sl()));
    sl.registerLazySingleton<BaseCategoryRepository>(() => CategoryRepository(sl()));
    sl.registerLazySingleton<BaseCategoryRemoteDateSource>(() => CategoryRemoteDateSource());

    sl.registerFactory(() => ProductDetailsByIdBloc(sl()));
    sl.registerLazySingleton(() => GetProductByIdUSeCase(sl()));
    sl.registerLazySingleton<BaseProductsDetailsRepository>(() => ProductRepository(sl()));
    sl.registerLazySingleton<BaseProductsDetailsRemoteDataSource>(() => ProductsDetailsRemoteDataSource());

  }
}