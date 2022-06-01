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
    // List<DiziModel> diziListt = [];

    // return Right(diziListt);

    try {
      Uri myUri = Uri.parse("http://127.0.0.1:3000/diziler");

      http.Response response = await http.get(myUri);

      List listJson = JsonHelper.convertResponseToList(response.body);
      //print("json list length " + listJson.length.toString());
      //print(listJson[0].toString());
      List<DiziModel> diziList = [];
      for (var i = 0; i < listJson.length; i++) {
        diziList.add(DiziModel.fromMap(listJson[i]));
      }
      return Right(diziList);
    } catch (e) {
      // print(e);
      return Left(ServerFailure(failureMessage: e.toString()));
    }
    // } on ServerException {
    //   return Left(ServerFailure());
    // }
  }

  @override
  Future<Either<Failure, Success>> addDizi(AddDiziParams params) async {
    var uri = Uri.parse("http://localhost:3000/diziler/");

    // Map<String, dynamic> bodyyy = {"LstUserOptions": "asdf"};

    // Map<String, dynamic> alt = {'team': 'Team A'};

    // bodyyy["homeTeam"] = null;

    Map<String, dynamic> bodyyy = params.eklenecekDizi.toMap();

    try {
      print("bodyyy - " + bodyyy.toString());
      var response = await http.post(
        uri,
        body: jsonEncode(bodyyy),
        headers: {
          "Content-Type": "application/json",
        },
      );
      return Right(DataAddedSuccess());
    } on ServerException {
      return Left(ServerFailure());
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
