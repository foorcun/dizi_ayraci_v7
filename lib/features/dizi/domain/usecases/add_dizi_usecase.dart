import 'package:dizi_ayraci_v7/core/usecases/add_usecase.dart';
import 'package:dizi_ayraci_v7/core/usecases/params/params.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/repositories/dizi_repository.dart';

class AddDiziUsecase implements AddUseCase<Dizi, AddDiziParams> {
  final DiziRepository diziRepository;
  AddDiziUsecase({
    required this.diziRepository,
  });

  @override
  Future<void> call(AddDiziParams params) async {
    // TODO: implement call
    return await diziRepository.addDizi(params);
  }
}

class AddDiziParams implements Params {
  DiziModel eklenecekDizi;
  AddDiziParams({
    required this.eklenecekDizi,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
