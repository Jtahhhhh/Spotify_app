import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/auth/signin_user_req.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../../repository/auth/auth_repository.dart';

class SigninUseCase implements Usecase<Either,SignInUserReq>{
  @override
  Future<Either> call({SignInUserReq ? param}) {
    return sl<AuthRepository>().signIn(param!);
  }
}