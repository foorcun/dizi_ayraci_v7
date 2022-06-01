import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/failure.dart';
import 'package:dizi_ayraci_v7/core/error/success.dart';
import 'package:dizi_ayraci_v7/core/usecases/delete_by_id_usecase.dart';
import 'package:dizi_ayraci_v7/core/usecases/params/params.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/repositories/dizi_repository.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/DiziRepository_bringer/dizi_repository_bringer.dart';

class DeleteDiziByIdUsecase
    implements DeleteByIdUsecase<Dizi, DeleteDiziByIdParams> {
  DiziRepository diziRepository;

  DeleteDiziByIdUsecase({required this.diziRepository});
  @override
  Future<Either<Failure, Success>> call(DeleteDiziByIdParams params) async {
    // TODO: implement call
    return await diziRepository.deleteDiziById(params);
  }
}

class DeleteDiziByIdParams implements Params {
  int id;
  DeleteDiziByIdParams({
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
