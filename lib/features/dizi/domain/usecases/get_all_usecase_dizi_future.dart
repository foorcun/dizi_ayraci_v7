import 'package:dizi_ayraci_v7/core/usecases/get_all_usecase_future.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/repositories/dizi_repository.dart';

class GetAllUseCaseDiziFuture implements GetAllUseCaseFuture<Dizi> {
  final DiziRepository repository;
  GetAllUseCaseDiziFuture(
    this.repository,
  );
  // @override
  // Stream<Either<Failure, List<Dizi>>> call(NoParams params) async* {
  //   repository.getAllDiziler();
  // }

  @override
  Future<List<Dizi>> call() {
    return repository.getAllDiziFuture();
  }
}
