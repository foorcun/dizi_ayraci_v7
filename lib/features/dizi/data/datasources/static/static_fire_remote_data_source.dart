import 'dart:convert';

import 'package:dizi_ayraci_v7/core/utils/json_helper.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/datasources/static/static_dizi_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/add_dizi_usecase.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/delete_dizi_by_id_usecase.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/dizi_update_patch_usecase.dart';

import 'package:http/http.dart' as http;

class StaticFireDiziRemoteDataSource implements StaticDiziRemoteDataSource {
  Uri myUri = Uri.parse("https://js-test-e5720.firebaseio.com/diziler.json");

  @override
  Future<List<DiziModel>> getAllDiziler() async {
    print("StaticFakeRemoteDataSource getAll");

    // Uri myUri = Uri.parse("https://js-test-e5720.firebaseio.com/.json");

    http.Response response = await http.get(myUri);

    List listJson = JsonHelper.convertResponseToList(response.body);
    //print("json list length " + listJson.length.toString());
    //print(listJson[0].toString());
    List<DiziModel> theList = [];
    for (var i = 0; i < listJson.length; i++) {
      theList.add(DiziModel.fromMap(listJson[i]));
    }
    print("DiziService theList " + theList.toString());
    return theList;
  }

  @override
  Future<void> deleteDiziById(DeleteDiziByIdParams params) async {
    // TODO: implement deleteDiziById
    // var uri = Uri.parse("http://localhost:3000/diziler/${params.id}");
    var uri = Uri.parse(myUri.path + "/" + params.id.toString());
    // await http.delete(uri).then((value) => print(value.body));
    await http.delete(uri);
  }

  @override
  Future<void> diziUpdatePatch(UpdateDiziPatchParams params) async {
    // TODO: implement diziUpdatePatch

    var uri = Uri.parse("http://localhost:3000/diziler/${params.yeniDizi.id}");

    Map<String, dynamic> bodyyy = params.yeniDizi.toMap();

    print("bana bakkk");

    try {
      print("bodyyy - " + bodyyy.toString());
      var response = await http.patch(
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

  @override
  Future<List<DiziModel>> getAllDiziFuture() async {
    // Uri myUri = Uri.parse("http://127.0.0.1:3000/diziler");
    // Uri myUri = Uri.parse("https://js-test-e5720.firebaseio.com/.json");

    // print(myUri.path);
    http.Response response = await http.get(myUri);
    print(response.body.toString());
    print("response status " + response.statusCode.toString());

    // String myResponse = "[" + response.body + "]";
    // String myResponse = response.body.substring(1);

    String myResponse = response.body.substring(1, response.body.length - 1);

    myResponse = "[" + myResponse + "]";
    print("--------------");
    print(myResponse);

    // String myResponse = response.body;

    Map mapJson = JsonHelper.convertJsonObjectsToList(response.body); // decode
    print("mapJson");
    print(mapJson.toString());

    // final diziL = JsonHelper.convertResponseToList(myResponse)
    //     .map((e) {
    //       return DiziModel.fromMap(e);
    //     })
    //     .toList()
    //     .cast<DiziModel>();
    // print("denemeeee");
    // print("diziL  lllll");

    // // print(diziL[0].toString());
    // print(diziL.toString());

    // print("json list length " + listJson.length.toString());
    // print("list Json ici " + listJson[1].toString());
    //
    List<DiziModel> diziList = [];
    // for (var i = 0; i < listJson.length; i++) {
    //   diziList.add(DiziModel.fromMap(listJson[i]));
    // }

    for (var key in mapJson.keys) {
      var d = DiziModel.fromMap(mapJson[key]);
      diziList.add(d);
    }

    return diziList;
  }

  @override
  Future<void> addDizi(AddDiziParams params) async {
    // TODO: implement addDizi
    // var uri = Uri.parse("http://localhost:3000/diziler/");
    // Uri uri = Uri.parse("https://js-test-e5720.firebaseio.com/.json");

    // var diz = params.eklenecekDizi as DiziModel;

    Map<String, dynamic> bodyyy = params.eklenecekDizi.toMap();
    print("bodyyy");
    print(bodyyy);

    var response = await http.post(
      myUri,
      body: jsonEncode(bodyyy),
      headers: {
        "Content-Type": "application/json",
      },
    );
  }

  // Uri addJsonNoktaDiziler(Uri myUri) {
  //   print(myUri.path + "diziler/.json");
  //   Uri uri = Uri.parse(myUri.path + "diziler/.json");
  //   return uri;
  // }
}
