import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dizi_ayraci_v7/core/error/exceptions.dart';
import 'package:dizi_ayraci_v7/core/error/failure.dart';
import 'package:dizi_ayraci_v7/core/error/success.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/delete_dizi_by_id_usecase.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/dizi_update_patch_usecase.dart';
import 'package:http/http.dart' as http;

import 'package:dizi_ayraci_v7/core/utils/json_helper.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/datasources/dynamic/dynamic_dizi_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/datasources/static/static_dizi_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/repositories/dizi_repository.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/add_dizi_usecase.dart';
import 'package:dizi_ayraci_v7/features/sezon/domain/entites/sezon.dart';

class DiziRepositoryImpl implements DiziRepository {
  StaticDiziRemoteDataSource? staticDiziRemoteDataSource;
  DynamicDiziRemoteDataSource? dynamicDiziRemoteDataSource;

  DiziRepositoryImpl(
      {this.staticDiziRemoteDataSource, this.dynamicDiziRemoteDataSource});

  @override
  Future<Either<Failure, List<Dizi>>> getAllDiziFuture() async {
    try {
      return Right(await staticDiziRemoteDataSource!.getAllDiziFuture());
    } catch (e) {
      return Left(ServerFailure(failureMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> addDizi(AddDiziParams params) async {
    try {
      await staticDiziRemoteDataSource!.addDizi(params);
      return Right(DataAddedSuccess());
    } catch (e) {
      print("catchteki hata : " + e.toString());
      return Left(BilinmeyenHataFailure(failureMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteDiziById(
      DeleteDiziByIdParams params) async {
    // TODO: implement deleteDiziById
    try {
      staticDiziRemoteDataSource?.deleteDiziById(params);
      return Right(DataDeletedSuccess());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Success>> diziUpdatePatch(
      UpdateDiziPatchParams params) async {
    // TODO: implement diziUpdatePatch
    try {
      staticDiziRemoteDataSource?.diziUpdatePatch(params);
      return Right(DataUpdatedSuccess());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Stream<Either<Failure, List<Dizi>>> getAllDiziStream() {
    // TODO: implement getAllDiziStream
    throw UnimplementedError();
  }
}
