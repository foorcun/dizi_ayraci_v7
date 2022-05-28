import 'package:dizi_ayraci_v7/features/dizi/data/datasources/dynamic/dynamic_dizi_remote_data_source.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';
import 'package:http/http.dart' as http;

class DiziFakeRemoteDataSource implements DynamicDiziRemoteDataSource {
  @override
  Stream<List<DiziModel>> getAllDiziler() {
    // TODO: implement getAllDiziler
    throw UnimplementedError();
  }
}
