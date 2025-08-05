import 'package:dartz/dartz.dart';
import 'package:practice_ecommerce/data/auth/models/user_creation_req.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReq user);
}
