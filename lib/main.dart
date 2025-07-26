import 'package:flutter/material.dart';
import 'package:practice_ecommerce/core/configs/theme/app_theme.dart';
import 'package:practice_ecommerce/presentation/splash/bloc/splash_cubit.dart';
import 'package:practice_ecommerce/presentation/splash/pages/splash.dart';
import 'package:practice_ecommerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce',
        theme: AppTheme.appTheme,
        home: SplashPage(),
      ),
    );
  }
}
