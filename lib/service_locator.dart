import 'package:get_it/get_it.dart';
import 'package:practice_ecommerce/data/auth/repository/auth_repository_impl.dart';
import 'package:practice_ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:practice_ecommerce/domain/auth/repository/auth.dart';
import 'package:practice_ecommerce/domain/auth/usecases/get_ages.dart';
import 'package:practice_ecommerce/domain/auth/usecases/get_user.dart';
import 'package:practice_ecommerce/domain/auth/usecases/is_logged_in.dart';
import 'package:practice_ecommerce/domain/auth/usecases/send_password_reset_email.dart';
import 'package:practice_ecommerce/domain/auth/usecases/signin.dart';
import 'package:practice_ecommerce/domain/auth/usecases/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  //repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(),
  );
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
}
