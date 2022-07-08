import 'package:auth/src/core/error/success.dart';
import 'package:auth/src/features/user/domain/entities/BenimUser.dart';
import 'package:auth/src/features/user/domain/usecases/write_user_data_usecase.dart';

abstract class StaticUserRemoteDataSource {
  Future<List<BenimUser>> getAllUserFuture();

  Future<Success> addUser(AddUserParams addUserParams);


  // Future<void> deleteDiziById(DeleteDiziByIdParams params);

  // Future<void> diziUpdatePatch(UpdateDiziPatchParams params);
}