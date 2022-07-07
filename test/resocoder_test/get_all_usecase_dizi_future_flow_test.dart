import 'package:dizi_ayraci_v7/features/dizi/data/datasources/static/static_dizi_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/datasources/static/static_fire_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/repositories/dizi_repository_impl.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/repositories/dizi_repository.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/get_all_usecase_dizi_future.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';



class MockStaticFireRemoteDataSource extends Mock implements StaticFireDiziRemoteDataSource{}

// test edilen GetAllUseCaseDiziFuture
// diziRepository interface - DiziRepositoryImpl implementation
// staticDiziRemoteDataSource interface - MockStaticFireRemoteDataSource implementation

void main() {
  late GetAllUseCaseDiziFuture sut; // system under test
  late DiziRepository diziRepository; // interface for poly
  late StaticDiziRemoteDataSource staticDiziRemoteDataSource; // interface for poly


  setUp(() {
    staticDiziRemoteDataSource = MockStaticFireRemoteDataSource(); // mock implementation class
    // staticDiziRemoteDataSource = StaticFireDiziRemoteDataSource();
    diziRepository = DiziRepositoryImpl(staticDiziRemoteDataSource:staticDiziRemoteDataSource ); // implementation class
    sut = GetAllUseCaseDiziFuture(diziRepository:diziRepository ); 
  });

  group('getDizi', () {

    void arrangeGetAllDiziFutureReturns3Dizi(){
      when(()=>staticDiziRemoteDataSource.getAllDiziFuture()).thenAnswer((_) async => []);
    }

    test(
      "usecase call flow testi",
      () async {
        //  arrangeGetAllDiziFutureReturns3Dizi();
      when(()=>staticDiziRemoteDataSource.getAllDiziFuture()).thenAnswer((_) async => []);

        await sut.call();
        verify(()=> staticDiziRemoteDataSource.getAllDiziFuture()).called(1);
        
      },
    );
  });
}


