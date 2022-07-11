import 'package:auth/auth.dart';
import 'package:auth/src/core/error/success.dart';
import 'package:auth/src/features/user/data/datasource/static/static_fire_user_remote_datasource.dart';
import 'package:auth/src/features/user/data/datasource/static/static_user_remote_data_source.dart';
import 'package:auth/src/features/user/data/repository/user_repository_impl.dart';
import 'package:auth/src/features/user/domain/entities/BenimUser.dart';
import 'package:auth/src/features/user/domain/repositories/user_repository.dart';
import 'package:auth/src/features/user/domain/usecases/write_user_data_usecase.dart';
import 'package:auth/src/features/user/presentation/state_management/user_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockStaticFireUserRemoteDataSource extends Mock
    implements StaticFireUserRemoteDataSource {}

class MockUserRepositoryImpl extends Mock implements UserRepositoryImpl {}

class MockAddUserParams extends Mock implements AddUserParams {}

class MockBenimUser extends Mock implements BenimUser {}

class MockWriteUserDataUsecase extends Mock implements WriteUserDataUsecase {}

void main() {
//sut class
  late WriteUserDataUsecase sut;
//gercek classlar
  late UserRepository userRepository;
//mock class
  late StaticUserRemoteDataSource
      staticUserRemoteDataSource; // interface for poly
  late MockAddUserParams mockAddUserParams;

  // Getx Test
  late UserController sutGetx;

//gercek classlar
  // late UserService userService;

//mock class
  late MockWriteUserDataUsecase writeUserDataUsecase;
  late BenimUser mockBenimUser;

  group("call flow test usecase - repository test", () {
    setUp(() {
//mock class

      mockAddUserParams = MockAddUserParams();
      mockBenimUser = MockBenimUser();
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

//   group("user getxController - usecase", () {
//     setUp(() {
//       //mock class

//       // userRepository = MockUserRepositoryImpl();
//       // mockBenimUser = MockBenimUser();

//       writeUserDataUsecase = MockWriteUserDataUsecase();

//       //gercek classlar

//       userService = UserService();

//       //sut class
//       sutGetx = UserController();
//     });

// //aaaTest buraya
//     test(
//       "getxController - usecase",
//       () async {
// //arrange

// //act
//         await sutGetx.writeUser(BenimUser());

// //assert
//       },
//     );
//   });
}
