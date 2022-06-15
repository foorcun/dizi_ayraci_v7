import 'dart:convert';

import 'package:dizi_ayraci_v7/features/dizi/data/datasources/static/static_fake_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:http/http.dart' as http;

class HttpClient extends Mock implements http.Client {}

void main() {
  StaticFakeRemoteDataSource sut;
  HttpClient client;

  setUp(() {
    // client = HttpClient();
    // sut = StaticFakeRemoteDataSource();
  });

  group("getAllDiziFuture()", () {
    test("returns an empty list when no dizi found", () async {
      // setup
      client = HttpClient();
      sut = StaticFakeRemoteDataSource();

      // arrange
      when(client.get(Uri())).thenAnswer(
          (_) async => http.Response(jsonEncode({"diziler": []}), 200));

      // act
      final results = await sut.getAllDiziFuture();

      // assert
      expect(results, []);
    });
  });
}

_dizilerJson() {
  return {
    "diziler": [
      {
        "id": 1,
        "diziName": "Attack on Titan",
        "sezonlar": [
          {"parentDiziId": 1, "id": 2, "sezonName": "1. Sezon"}
        ]
      },
      {"id": 2, "diziName": "Breaking Bad", "sezonlar": []},
      {"id": 3, "diziName": "Çarpışma", "sezonlar": []}
    ]
  };
}
