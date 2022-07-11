import 'package:auth/src/core/error/success.dart';
import 'package:auth/src/features/user/data/datasource/static/static_fire_user_remote_datasource.dart';
import 'package:auth/src/features/user/data/datasource/static/static_user_remote_data_source.dart';
import 'package:auth/src/features/user/data/repository/user_repository_impl.dart';
import 'package:auth/src/features/user/domain/entities/BenimUser.dart';
import 'package:auth/src/features/user/domain/repositories/user_repository.dart';
import 'package:auth/src/features/user/domain/usecases/write_user_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockStaticFireUserRemoteDataSource extends Mock
    implements StaticFireUserRemoteDataSource {}

class MockUserRepositoryImpl extends Mock implements UserRepositoryImpl {}

class MockBenimUser extends Mock implements BenimUser {}

class MockAddUserParams extends Mock implements AddUserParams {}

void main() {
//sut class
  late WriteUserDataUsecase sut;
//gercek classlar
  late UserRepository userRepository;
//mock class
  late StaticUserRemoteDataSource
      staticUserRemoteDataSource; // interface for poly
  late MockAddUserParams mockAddUserParams;

  group("usecase - repository test", () {
    setUp(() {
//mock class
      staticUserRemoteDataSource = MockStaticFireUserRemoteDataSource();

      mockAddUserParams = MockAddUserParams();
//gercek classlar
      userRepository =
          MockUserRepositoryImpl(); //! call flow ilk adimi olan usercase-repository test icin gerekli
// userRepository = UserRepositoryImpl(staticUserRemoteDataSource:staticUserRemoteDataSource );

      sut = WriteUserDataUsecase(userRepository: userRepository);
    });
    test(
      "mock repository",
      () async {
        //arrange
        when(() => userRepository.addUser(mockAddUserParams))
            .thenAnswer((_) async => Right(MockSuccess()));

        //act
        await sut.call(mockAddUserParams);

        //assert
        verify(() => userRepository.addUser(mockAddUserParams)).called(1);
      },
    );
  });

  group('call flow test usecase-repository-datasource', () {
    setUp(() {
//mock class
      staticUserRemoteDataSource = MockStaticFireUserRemoteDataSource();

      mockAddUserParams = MockAddUserParams();
//gercek classlar
// userRepository = MockUserRepositoryImpl(); //! call flow ilk adimi olan usercase-repository test icin gerekli
      userRepository = UserRepositoryImpl(
          staticUserRemoteDataSource: staticUserRemoteDataSource);

      sut = WriteUserDataUsecase(userRepository: userRepository);
    });
    void arrangeWriteUserData() {
      when(() => staticUserRemoteDataSource.addUser(mockAddUserParams))
          .thenAnswer((_) async => MockSuccess());
    }

    test(
      "write user call test",
      () async {
//arrange
// arrangeWriteUserData();
        when(() => staticUserRemoteDataSource.addUser(mockAddUserParams))
            .thenAnswer((_) async => MockSuccess());

//act
        await sut.call(mockAddUserParams);
        // await sut.call(AddUserParams(eklenecekUser: MockBenimUser()));

//assert
        verify(() => staticUserRemoteDataSource.addUser(mockAddUserParams))
            .called(1);
      },
    );

    ///
  });
}
