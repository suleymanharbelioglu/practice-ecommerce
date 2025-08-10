import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ecommerce/domain/auth/usecases/is_logged_in.dart';
import 'package:practice_ecommerce/presentation/splash/bloc/splash_state.dart';
import 'package:practice_ecommerce/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  Future<void> appStarted() async {
    await Future.delayed(Duration(seconds: 3));

    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }
}
