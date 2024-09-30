import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecase/usecase.dart';
import 'package:spotify_app/data/models/auth/create_user_req.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';

import '../../../service_locator.dart';

class SignupUseCase implements Usecase<Either,CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq ? param}) {
    return sl<AuthRepository>().signUp(param!);
  }
}