import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ecommerce/presentation/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  Future<void> appStarted() async {
    await Future.delayed(Duration(seconds: 3));

    emit(Unauthenticated());
  }
}
