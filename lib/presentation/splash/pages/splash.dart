import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practice_ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:practice_ecommerce/core/configs/assets/app_vectors.dart';
import 'package:practice_ecommerce/core/configs/theme/app_colors.dart';
import 'package:practice_ecommerce/presentation/auth/pages/signin.dart';
import 'package:practice_ecommerce/presentation/home/pages/home.dart';
import 'package:practice_ecommerce/presentation/splash/bloc/splash_cubit.dart';
import 'package:practice_ecommerce/presentation/splash/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          AppNavigator.pushAndRemove(context, SigninPage());
        }
        if (state is Authenticated) {
          AppNavigator.pushAndRemove(context, HomePage());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(child: SvgPicture.asset(AppVectors.appLogo)),
      ),
    );
  }
}
