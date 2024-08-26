import 'package:ecommerce_clot/core/configs/theme/app_theme.dart';
import 'package:ecommerce_clot/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce_clot/presentation/splash/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashCubit()..appStarted()),
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
