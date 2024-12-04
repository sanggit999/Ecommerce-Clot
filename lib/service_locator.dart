import 'package:ecommerce_clot/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce_clot/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_clot/data/category/repository/category_repository_impl.dart';
import 'package:ecommerce_clot/data/category/source/category_firebase_service.dart';
import 'package:ecommerce_clot/data/order/repository/order_repository_impl.dart';
import 'package:ecommerce_clot/data/order/source/order_firebase_service.dart';
import 'package:ecommerce_clot/data/product/repository/product_repository_impl.dart';
import 'package:ecommerce_clot/data/product/source/product_firebase_service.dart';
import 'package:ecommerce_clot/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce_clot/domain/auth/usecase/get_ages.dart';
import 'package:ecommerce_clot/domain/auth/usecase/get_user.dart';
import 'package:ecommerce_clot/domain/auth/usecase/is_logged_in.dart';
import 'package:ecommerce_clot/domain/auth/usecase/signin.dart';
import 'package:ecommerce_clot/domain/auth/usecase/signup.dart';
import 'package:ecommerce_clot/domain/category/repository/category_repository.dart';
import 'package:ecommerce_clot/domain/category/usecase/get_categories.dart';
import 'package:ecommerce_clot/domain/order/repository/order_repository.dart';
import 'package:ecommerce_clot/domain/order/usecase/add_to_bag.dart';
import 'package:ecommerce_clot/domain/product/repository/product_repository.dart';
import 'package:ecommerce_clot/domain/product/usecase/get_prodcut_top_selling.dart';
import 'package:ecommerce_clot/domain/product/usecase/get_product_by_category_id.dart';
import 'package:ecommerce_clot/domain/product/usecase/get_product_by_title.dart';
import 'package:ecommerce_clot/domain/product/usecase/get_product_new_in.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  // SERVICES;
  // KHOI TAO NGAY LAP TUC TON TAI SUOT DOI KHI CHAY UNG DUNG
  serviceLocator
      .registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  serviceLocator.registerSingleton<CategoryFirebaseService>(
      CategoryFirebaseServiceImpl());

  serviceLocator
      .registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());


  serviceLocator
      .registerSingleton<OrderFirebaseService>(OrderFirebaseServiceImpl());


  // REPOSITORIES

  // AUTH
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // CATEGORY
  serviceLocator
      .registerSingleton<CategoryRepository>(CategoryRepositoryImpl());

  // PRODUCT
  serviceLocator.registerSingleton<ProductRepository>(ProductRepositoryImpl());

  // ORDER
  serviceLocator.registerSingleton<OrderRepository>(OrderRepositoryImpl());

  // USECASE

  // AUTH
  serviceLocator.registerSingleton<SignUpUseCase>(SignUpUseCase());

  serviceLocator.registerSingleton<SignInUseCase>(SignInUseCase());

  serviceLocator.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());

  serviceLocator.registerSingleton<GetAgesUseCase>(GetAgesUseCase());

  serviceLocator.registerSingleton<GetUserUseCase>(GetUserUseCase());

  // CATEGORY
  serviceLocator
      .registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());

  // PRODUCT
  serviceLocator.registerSingleton<GetProductTopSellingUseCase>(
      GetProductTopSellingUseCase());
  serviceLocator
      .registerSingleton<GetProductNewInUseCase>(GetProductNewInUseCase());
  serviceLocator.registerSingleton<GetProductByCategoryIdUseCase>(
      GetProductByCategoryIdUseCase());

  serviceLocator
      .registerSingleton<GetProductByTitleUseCase>(GetProductByTitleUseCase());


  serviceLocator
      .registerSingleton<AddToBagUseCase>(AddToBagUseCase());
}