import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/data/models/auth/signin_user_req.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';

import '../../../service_locator.dart';
import '../../models/auth/create_user_req.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signIn(SignInUserReq user) async {
    return await sl<AuthFirebaseService>().signin(user);
  }

  @override
  Future<Either> signUp(CreateUserReq user) async {
      return await sl<AuthFirebaseService>().signup(user);
  }

}