 import 'package:dartz/dartz.dart';
import 'package:practice_ecommerce/data/auth/models/user_creation_req.dart';
import 'package:practice_ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:practice_ecommerce/domain/auth/repository/auth.dart';
import 'package:practice_ecommerce/service_locator.dart';

class AuthRepositoryImpl  extends AuthRepository{
  @override
  Future<Either> signup(UserCreationReq user) {
   return sl<AuthFirebaseService>().signup(user);
  }
}