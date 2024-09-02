import 'package:ecommerce_clot/core/configs/theme/app_theme.dart';
import 'package:ecommerce_clot/firebase_options.dart';
import 'package:ecommerce_clot/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:ecommerce_clot/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce_clot/presentation/splash/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashCubit()..appStarted()),
        BlocProvider(create: (_)=>GenderSelectionCubit()),
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
