import 'dart:convert';

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
  Future<List<Dizi>> getAllDiziFuture() async {
    Uri myUri = Uri.parse("http://127.0.0.1:3000/diziler");

    http.Response response = await http.get(myUri);

    List listJson = JsonHelper.convertResponseToList(response.body);
    //print("json list length " + listJson.length.toString());
    //print(listJson[0].toString());
    List<DiziModel> diziList = [];
    for (var i = 0; i < listJson.length; i++) {
      diziList.add(DiziModel.fromMap(listJson[i]));
    }

    return diziList;
  }

  @override
  Stream<List<Dizi>> getAllDiziStream() {
    // TODO: implement getAllDiziStream
    throw UnimplementedError();
  }

  @override
  Future<void> addDizi(AddDiziParams params) async {
    var uri = Uri.parse("http://localhost:3000/diziler");

    Map<String, dynamic> bodyyy = {"LstUserOptions": "asdf"};

    Map<String, dynamic> alt = {'team': 'Team A'};

    bodyyy["homeTeam"] = null;

    try {
      print("bodyyy - " + bodyyy.toString());
      var response = await http.post(
        uri,
        body: jsonEncode(bodyyy),
        headers: {
          "Content-Type": "application/json",
        },
      );
    } catch (e) {
      print(e);
    }
  }
}

class Ddd {
  String? ddd;
  Ddd({
    this.ddd,
  });

  Ddd copyWith({
    String? ddd,
  }) {
    return Ddd(
      ddd: ddd ?? this.ddd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
    };
  }

  factory Ddd.fromMap(Map<String, dynamic> map) {
    return Ddd(
      ddd: map['ddd'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ddd.fromJson(String source) => Ddd.fromMap(json.decode(source));

  @override
  String toString() => 'Ddd(ddd: $ddd)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ddd && other.ddd == ddd;
  }

  @override
  int get hashCode => ddd.hashCode;
}
