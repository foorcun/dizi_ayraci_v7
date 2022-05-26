import 'package:dizi_ayraci_v7/core/usecases/get_all_usecase_stream.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/repositories/dizi_repository.dart';

class GetAllUseCaseDiziStream implements GetAllUseCaseStream<Dizi> {
  final DiziRepository repository;
  GetAllUseCaseDiziStream(
    this.repository,
  );
  // @override
  // Stream<Either<Failure, List<Dizi>>> call(NoParams params) async* {
  //   repository.getAllDiziler();
  // }

  @override
  Stream<List<Dizi>> call() {
    return repository.getAllDiziStream();
  }
}
