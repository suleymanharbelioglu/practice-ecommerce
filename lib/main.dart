import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ecommerce/core/configs/theme/app_theme.dart';
import 'package:practice_ecommerce/firebase_options.dart';
import 'package:practice_ecommerce/presentation/splash/bloc/splash_cubit.dart';
import 'package:practice_ecommerce/presentation/splash/pages/splash.dart';
import 'package:practice_ecommerce/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        theme: AppTheme.appTheme,
        title: 'Practice Ecommerce',
        home: SplashPage(),
      ),
    );
  }
}
