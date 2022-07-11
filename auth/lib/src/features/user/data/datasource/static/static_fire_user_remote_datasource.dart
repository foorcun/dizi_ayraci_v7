import 'package:auth/src/core/error/success.dart';
import 'package:auth/src/features/user/data/datasource/static/static_user_remote_data_source.dart';
import 'package:auth/src/features/user/domain/entities/BenimUser.dart';
import 'package:auth/src/features/user/domain/usecases/write_user_data_usecase.dart';

class StaticFireUserRemoteDataSource implements StaticUserRemoteDataSource {
  @override
  Future<Success> addUser(AddUserParams addUserParams) async {
    // TODO: implement addUser
    // throw UnimplementedError();
    print("StaticFireUserRemoteDataSource add user");
    print(addUserParams.toString());
    return MockSuccess();
  }

  @override
  Future<List<BenimUser>> getAllUserFuture() {
    // TODO: implement getAllUserFuture
    throw UnimplementedError();
  }
}
