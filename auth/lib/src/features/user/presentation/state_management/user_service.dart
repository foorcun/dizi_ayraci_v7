import '../../../../core/error/failure.dart';
import '../../data/datasource/auth_strateji.dart';
import '../../domain/entities/BenimUser.dart';
import 'package:dartz/dartz.dart';

import '../../../../../src/injection_container.dart' as di;
import '../../domain/usecases/sign_in_user_usecase.dart';

class UserService {
  Future<Either<Failure, BenimUser>> signIn(AuthStrateji authStrateji) async {
    print('UserService');
    return di.sl<SignInUserUsecase>().call(authStrateji);
  }
}
