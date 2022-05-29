import 'package:dartz/dartz.dart';

abstract class AddUseCase<Type, Params> {
  Future<void> call(Params params);
}
