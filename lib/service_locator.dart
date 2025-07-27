
import 'package:get_it/get_it.dart';
import 'package:practice_ecommerce/data/auth/repository/auth_repository_impl.dart';
import 'package:practice_ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:practice_ecommerce/domain/auth/repository/auth.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async{
 // services 
   sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  //repository
    sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

   // Usecases


}