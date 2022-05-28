// import 'package:dizi_ayraci_v7/core/utils/json_helper.dart';
// import 'package:http/http.dart' as http;

// class JsonToObjects<DataClass> {
//   Future<List<DataClass>> getAll(String url) async {
//     Uri myUri = Uri.parse(url);

//     http.Response response = await http.get(myUri);

//     List listJson = JsonHelper.convertResponseToList(response.body);
//     //print("json list length " + listJson.length.toString());
//     //print(listJson[0].toString());
//     List<DataClass> theList = [];
//     for (var i = 0; i < listJson.length; i++) {
//       theList.add(newMethod(listJson, i));
//     }

//     return theList;
//   }

//   newMethod(List<dynamic> listJson, int i) => DataClass.fromJson(listJson[i]);
// }

// abstract class DataClass {
//   fromJson();
// }
