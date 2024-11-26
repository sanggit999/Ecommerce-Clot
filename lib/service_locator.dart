import 'package:ecommerce_clot/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce_clot/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_clot/data/categories/repository/category_repository_impl.dart';
import 'package:ecommerce_clot/data/categories/source/category_firebase_service.dart';
import 'package:ecommerce_clot/data/products/repository/product_repository_impl.dart';
import 'package:ecommerce_clot/data/products/source/product_firebase_service.dart';
import 'package:ecommerce_clot/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce_clot/domain/auth/usecase/get_ages.dart';
import 'package:ecommerce_clot/domain/auth/usecase/get_user.dart';
import 'package:ecommerce_clot/domain/auth/usecase/is_logged_in.dart';
import 'package:ecommerce_clot/domain/auth/usecase/signin.dart';
import 'package:ecommerce_clot/domain/auth/usecase/signup.dart';
import 'package:ecommerce_clot/domain/categories/repository/category_repository.dart';
import 'package:ecommerce_clot/domain/categories/usecase/get_categories.dart';
import 'package:ecommerce_clot/domain/products/repository/product_repository.dart';
import 'package:ecommerce_clot/domain/products/usecase/get_new_in.dart';
import 'package:ecommerce_clot/domain/products/usecase/get_top_selling.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  // SERVICES;
  // KHOI TAO NGAY LAP TUC TON TAI SUOT DOI KHI CHAY UNG DUNG
  serviceLocator
      .registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  serviceLocator.registerSingleton<CategoryFirebaseService>(
      CategoryFirebaseServiceImpl());

  serviceLocator.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());

  // REPOSITORIES
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  serviceLocator
      .registerSingleton<CategoryRepository>(CategoryRepositoryImpl());

  serviceLocator.registerSingleton<ProductRepository>(ProductRepositoryImpl());

  // USECASE
  serviceLocator.registerSingleton<SignUpUseCase>(SignUpUseCase());

  serviceLocator.registerSingleton<SignInUseCase>(SignInUseCase());

  serviceLocator.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  serviceLocator.registerSingleton<GetAgesUseCase>(GetAgesUseCase());

  serviceLocator.registerSingleton<GetUserUseCase>(GetUserUseCase());

  serviceLocator
      .registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());

  serviceLocator.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());
  serviceLocator.registerSingleton<GetNewInUseCase>(GetNewInUseCase());
}
