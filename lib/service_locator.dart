import 'package:ecommerce_clot/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce_clot/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce_clot/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce_clot/domain/auth/usecase/sign_up_usecase.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeDependencies() async {
  // SERVICES;
  // KHOI TAO NGAY LAP TUC TON TAI SUOT DOI KHI CHAY UNG DUNG
  serviceLocator
      .registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  // REPOSITORIES
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // USECASE
  serviceLocator.registerSingleton<SignUpUseCase>(SignUpUseCase());
}