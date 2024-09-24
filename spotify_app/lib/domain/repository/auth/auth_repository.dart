import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';

abstract class AuthRepository{

  Future<Either> signUp(CreateUserReq user);
  Future<void> signIn();

}