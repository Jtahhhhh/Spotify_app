import 'package:firebase_auth/firebase_auth.dart';

import '../../models/auth/create_user_req.dart';

abstract class AuthFirebaseService{

  Future<void> signup(CreateUserReq user);
  Future<void> signin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateUserReq user) async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email,
          password: user.password);

    } on FirebaseAuthException{

    }
  }

}