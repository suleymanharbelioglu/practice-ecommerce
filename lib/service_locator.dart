import 'package:get_it/get_it.dart';
import 'package:practice_ecommerce/data/auth/repository/auth_repository_impl.dart';
import 'package:practice_ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:practice_ecommerce/data/category/repository/category.dart';
import 'package:practice_ecommerce/data/category/source/category_firebase_service.dart';
import 'package:practice_ecommerce/data/product/repository/product.dart';
import 'package:practice_ecommerce/data/product/source/product_firebase_service.dart';
import 'package:practice_ecommerce/domain/auth/repository/auth.dart';
import 'package:practice_ecommerce/domain/auth/usecases/get_ages.dart';
import 'package:practice_ecommerce/domain/auth/usecases/get_user.dart';
import 'package:practice_ecommerce/domain/auth/usecases/is_logged_in.dart';
import 'package:practice_ecommerce/domain/auth/usecases/send_password_reset_email.dart';
import 'package:practice_ecommerce/domain/auth/usecases/signin.dart';
import 'package:practice_ecommerce/domain/auth/usecases/signup.dart';
import 'package:practice_ecommerce/domain/category/repository/category.dart';
import 'package:practice_ecommerce/domain/category/usecases/get_categories.dart';
import 'package:practice_ecommerce/domain/product/repository/product.dart';
import 'package:practice_ecommerce/domain/product/usecases/get_new_in.dart';
import 'package:practice_ecommerce/domain/product/usecases/get_products_by_category_id.dart';
import 'package:practice_ecommerce/domain/product/usecases/get_top_selling.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseSeviceImpl());
  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());

  //repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());

  //usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(),
  );
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetCategoriesUseCase>(GetCategoriesUseCase());
  sl.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());
  sl.registerSingleton<GetNewInUseCase>(GetNewInUseCase());
  sl.registerSingleton<GetProductsByCategoryIdUseCase>(GetProductsByCategoryIdUseCase());
}
