import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/datasources/dynamic/dizi_fake_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/datasources/dynamic/dynamic_dizi_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/datasources/static/static_dizi_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/datasources/static/static_fake_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/repositories/dizi_repository_impl.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/repositories/dizi_repository.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/add_dizi_usecase.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/get_all_usecase_dizi_future.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

// pubspec.yaml
// # Service locator
// get_it: 7.2.0
final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  // sl.registerFactory(
  //   () => NumberTriviaBloc(
  //     concrete: sl(),
  //     inputConverter: sl(),
  //     random: sl(),
  //   ),
  // );

  // Use cases // BÜTÜN DATA ÇAĞIRMALARI USE CASESLER İLE OLACAK
  // sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  // sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));
  // //! book use case
  // sl.registerLazySingleton(() => GetAllBooks(sl()));
  // sl.registerLazySingleton(() => GetAllUseCaseBooks(sl()));
  // sl.registerLazySingleton(() => AddUseCaseBook(sl()));
  // sl.registerLazySingleton(() => DeleteUseCaseBook(sl()));
  // sl.registerLazySingleton(() => FindByIDUseCaseBook(sl()));
  //! dizi use case
  // sl.registerLazySingleton(() => GetAllUseCaseDiziStream(sl()));
  // sl.registerLazySingleton(() => GetAllByFailureDiziler(sl()));
  // sl.registerLazySingleton(() => GetAllDizilerByUser(sl()));
  // sl.registerLazySingleton(() => AddDiziToUser(sl()));
  sl.registerLazySingleton(() => GetAllUseCaseDiziFuture(sl()));
  sl.registerLazySingleton(() => AddDiziUsecase(diziRepository: sl()));

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
  sl.registerLazySingleton<DiziRepository>(
    () => DiziRepositoryImpl(
        // networkInfo: sl(),
        staticDiziRemoteDataSource: sl(),
        dynamicDiziRemoteDataSource: sl()),
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
  sl.registerLazySingleton<StaticDiziRemoteDataSource>(
    () => StaticFakeRemoteDataSource(
        // firebaseStore: FirebaseFirestore.instance),
        ),
  );

  sl.registerLazySingleton<DynamicDiziRemoteDataSource>(
    () => DiziFakeRemoteDataSource(
        // firebaseStore: FirebaseFirestore.instance),
        ),
  );
  //! Core
  // sl.registerLazySingleton(() => InputConverter());
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}
