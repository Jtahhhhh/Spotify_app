import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/auth/create_user_req.dart';

abstract class AuthFirebaseService{

  Future<Either> signup(CreateUserReq user);
  Future<void> signin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
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