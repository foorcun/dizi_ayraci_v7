import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/failure.dart';

import '../../../../core/usecases/get_all_usecase_stream.dart';
import '../entities/dizi.dart';
import '../repositories/dizi_repository.dart';

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
  Stream<Either<Failure, List<Dizi>>> call() {
    return repository.getAllDiziStream();
  }
}
