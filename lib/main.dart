import 'package:ecommerce_clot/common/bloc/button/button_cubit.dart';
import 'package:ecommerce_clot/core/configs/theme/app_theme.dart';
import 'package:ecommerce_clot/firebase_options.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/age_selection_cubit.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/ages_display_cubit.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/gender_selection_cubit.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/validate_cubit.dart';
import 'package:ecommerce_clot/presentation/splash/cubit/splash_cubit.dart';
import 'package:ecommerce_clot/presentation/splash/pages/splash.dart';
import 'package:ecommerce_clot/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashCubit()..appStarted()),
        BlocProvider(create: (_) => GenderSelectionCubit()),
        BlocProvider(create: (_) => AgesDisplayCubit()),
        BlocProvider(create: (_) => AgeSelectionCubit()),
        BlocProvider(create: (_) => ButtonCubit()),
        BlocProvider(create: (_) => ValidateCubit()),
      ],
      child: MaterialApp(
        title: 'Ecommerce Clot',
        themeMode: ThemeMode.system,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
