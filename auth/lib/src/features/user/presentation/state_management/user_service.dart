import 'package:auth/src/core/error/success.dart';

import '../../../../core/error/failure.dart';
import '../../data/datasource/auth_strateji.dart';
import '../../domain/entities/BenimUser.dart';
import 'package:dartz/dartz.dart';

import '../../../../../src/injection_container.dart' as di;
import '../../domain/usecases/sign_in_user_usecase.dart';

import 'package:auth/src/features/user/domain/usecases/write_user_data_usecase.dart';

class UserService {
  Future<Either<Failure, BenimUser>> signIn(AuthStrateji authStrateji) async {
    print('UserService');
    return di.sl<SignInUserUsecase>().call(authStrateji);
  }

  Future<Either<Failure, Success>> writeUser(AddUserParams params) async {
    // throw UnimplementedError();
    // return Right(MockSuccess());
    return di.sl<WriteUserDataUsecase>().call(params);
  }
}
