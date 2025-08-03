import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ecommerce/core/configs/theme/app_theme.dart';
import 'package:practice_ecommerce/presentation/splash/bloc/splash_cubit.dart';
import 'package:practice_ecommerce/presentation/splash/pages/splash.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        title: 'Practice Ecommerce',
        home: SplashPage(),
      ),
    );
  }
}
