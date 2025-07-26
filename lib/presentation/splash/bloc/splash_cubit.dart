import 'package:bloc/bloc.dart';
import 'package:practice_ecommerce/presentation/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(Duration(seconds: 3));
    emit(UnAuthenticated());
  }
}
