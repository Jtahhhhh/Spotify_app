import 'package:spotify_app/data/models/auth/create_user_req.dart';

abstract class AuthRepository{

  Future<void> signUp(CreateUserReq user);
  Future<void> signIn();

}