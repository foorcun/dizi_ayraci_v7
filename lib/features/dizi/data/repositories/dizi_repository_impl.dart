import 'package:dizi_ayraci_v7/core/utils/json_helper.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/datasources/dynamic/dynamic_dizi_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/datasources/static/static_dizi_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/dizi/domain/repositories/dizi_repository.dart';
import 'package:http/http.dart' as http;

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
}
