import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/data/models/auth/signin_user_req.dart';
import 'package:spotify_app/domain/usecases/auth/signup.dart';

import '../../models/auth/create_user_req.dart';

abstract class AuthFirebaseService{

  Future<Either> signup(CreateUserReq user);
  Future<Either> signin(SignInUserReq user);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> signin(SignInUserReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email,
          password: user.password);
      return const Right('Sign In was successful'); // Trả về thành công
    } on FirebaseAuthException catch (e) {
      String msg = '';
      if(e.code =='invalid-email'){
        msg = 'Not found user';
      }
      else if (e.code=='invalid-credential'){
        msg = 'Wrong password';
      }

      return Left(msg);
    } catch (e) {
      return Left('An unknown error occurred: ${e.toString()}');
    }
  }

  @override
  Future<Either> signup(CreateUserReq user) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email,
          password: user.password);
      return const Right('Sign Up was successful'); // Trả về thành công
    } on FirebaseAuthException catch (e) {
      String msg = '';
      if(e.code =='weak-password'){
        msg = 'The password provider is weak';
      }
      else if (e.code=='email-already-in-use'){
        msg = 'Account already exists';
      }

      return Left(msg);
    } catch (e) {
      return Left('An unknown error occurred: ${e.toString()}');
    }
  }


}