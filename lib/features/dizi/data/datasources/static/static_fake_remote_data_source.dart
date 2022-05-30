import 'dart:convert';

import 'package:dizi_ayraci_v7/core/utils/json_helper.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/datasources/static/static_dizi_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/delete_dizi_by_id_usecase.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/usecases/dizi_update_patch_usecase.dart';

import 'package:http/http.dart' as http;

class StaticFakeRemoteDataSource implements StaticDiziRemoteDataSource {
  @override
  Future<List<DiziModel>> getAllDiziler() async {
    print("StaticFakeRemoteDataSource getAll");

    Uri myUri = Uri.parse("http://127.0.0.1:3000/diziler");

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
    var uri = Uri.parse("http://localhost:3000/diziler/${params.id}");
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
}
