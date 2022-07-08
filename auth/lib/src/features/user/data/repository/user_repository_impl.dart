import 'package:auth/src/features/user/data/datasource/static/static_user_remote_data_source.dart';
import 'package:auth/src/features/user/domain/usecases/write_user_data_usecase.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../../core/error/success.dart';
import '../datasource/auth_strateji.dart';
import '../../domain/entities/BenimUser.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {

    StaticUserRemoteDataSource? staticUserRemoteDataSource;

  UserRepositoryImpl(
      {required this.staticUserRemoteDataSource});

  @override
  Future<Either<Failure, BenimUser>> signIn(AuthStrateji authStrateji) {
    // TODO: implement signIn
    return authStrateji.signIn(authStrateji);
  }

  @override
  Future<Either<Failure, Success>> signOut(BenimUser benimUser) {
    // TODO: implement signOut
    return benimUser.authStrateji!.signOut();
  }
  
  @override
  Future<Either<Failure, Success>> addUser(AddUserParams addUserParams)async {
    // TODO: implement addUser
    // throw UnimplementedError();

    try {
     staticUserRemoteDataSource?.addUser(addUserParams);

      return Right(DataUpdatedSuccess());
    } on Exception {
      // return Left(ServerFailure());
      return Right(DataUpdatedSuccess());

    }
  }


}
