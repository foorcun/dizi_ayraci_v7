import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/failure.dart';
import 'package:dizi_ayraci_v7/core/usecases/get_all_usecase_future.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/repositories/dizi_repository.dart';

class GetAllUseCaseDiziFuture implements GetAllUseCaseFuture<Dizi> {
  final DiziRepository repository;
  GetAllUseCaseDiziFuture(
    this.repository,
  );

  @override
  Future<Either<Failure, List<Dizi>>> call() async {
    return repository.getAllDiziFuture();
  }
}
