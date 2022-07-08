import 'package:auth/src/features/user/data/datasource/static/static_fire_user_remote_datasource.dart';

import 'features/user/data/repository/user_repository_impl.dart';
import 'features/user/domain/repositories/user_repository.dart';
import 'features/user/domain/usecases/sign_in_user_usecase.dart';
import 'features/user/domain/usecases/sign_out_user_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  //! dizi use case
  sl.registerLazySingleton(() => SignInUserUsecase(repository: sl()));
  sl.registerLazySingleton(() => SignOutUserUsecase(repository: sl()));
  // sl.registerLazySingleton(() => AddDiziUsecase(diziRepository: sl()));
  // sl.registerLazySingleton(() => DeleteDiziByIdUsecase(diziRepository: sl()));
  // sl.registerLazySingleton(() => DiziUpdatePatchUsecase(diziRepository: sl()));

  //! Repository
  // sl.registerLazySingleton<NumberTriviaRepository>(
  //   () => NumberTriviaRepositoryImpl(
  //     localDataSource: sl(),
  //     // networkInfo: sl(),
  //     remoteDataSource: sl(),
  //   ),
  // );
  // ! book repository
  // sl.registerLazySingleton<BookRepository>(
  //   () => BookRepositoryImpl(
  //     // networkInfo: sl(),
  //     remoteDataSource: sl(),
  //   ),
  // );

  // ! dizi repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl( staticUserRemoteDataSource: StaticFireUserRemoteDataSource()
        // networkInfo: sl(),

        ),
  );

  // Data sources
  // sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
  //   () => NumberTriviaRemoteDataSourceImpl(client: sl()),
  // );

  //! data source
  // sl.registerLazySingleton<NumberTriviaLocalDataSource>(
  //   () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
  // );

  // sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
  //   () => NumberTriviaFirebaseDataSourceImpl(
  //       firebaseStore: FirebaseFirestore.instance),
  // );
  //! books data source
  // sl.registerLazySingleton<BookRemoteDataSource>(
  //   () => BookFirebaseRemoteDataSourceImpl(
  //       firebaseStore: FirebaseFirestore.instance),
  // );

  //! diziler data source
  // sl.registerLazySingleton<StaticDiziRemoteDataSource>(
  //   () => StaticFakeRemoteDataSource(
  //       // firebaseStore: FirebaseFirestore.instance),
  //       ),
  // );

  // sl.registerLazySingleton<DynamicDiziRemoteDataSource>(
  //   () => DiziFakeRemoteDataSource(
  //       // firebaseStore: FirebaseFirestore.instance),
  //       ),
  // );
  //! Core
  // sl.registerLazySingleton(() => InputConverter());
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}
