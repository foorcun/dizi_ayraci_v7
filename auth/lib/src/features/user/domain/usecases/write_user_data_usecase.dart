import 'package:auth/src/core/error/failure.dart';
import 'package:auth/src/core/error/success.dart';
import 'package:auth/src/core/usecases/add_domain_usecase.dart';
import 'package:auth/src/core/usecases/params.dart';
import 'package:auth/src/features/user/domain/entities/BenimUser.dart';
import 'package:auth/src/features/user/domain/repositories/user_repository.dart';
import 'package:auth/src/features/user/domain/usecases/user_usecase.dart';
import 'package:dartz/dartz.dart';

class WriteUserDataUsecase extends AddDomainUsecase<BenimUser, AddUserParams> {
  final UserRepository userRepository;

  WriteUserDataUsecase({required this.userRepository});

  @override
  Future<Either<Failure, Success>> call(AddUserParams params) async {
    // TODO: implement call
    return userRepository.addUser(params);
    // return Right(MockSuccess());
  }
}

class AddUserParams implements Params {
  final BenimUser eklenecekUser;
  AddUserParams({
    required this.eklenecekUser,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
