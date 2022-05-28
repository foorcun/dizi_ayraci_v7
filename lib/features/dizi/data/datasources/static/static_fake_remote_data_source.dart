import 'package:dizi_ayraci_v7/core/utils/json_helper.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/datasources/static/static_dizi_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';

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
}
