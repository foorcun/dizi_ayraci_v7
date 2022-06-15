import 'package:dizi_ayraci_v7/core/utils/json_helper.dart';
import 'package:dizi_ayraci_v7/features/dizi/data/models/dizi_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("convertResponseToList", () {
    //setup
    String localResponse = '''   [
    {
      "id": 1,
      "diziName": "Attack on Titan",
      "sezonlar": [
        {
          "parentDiziId": 1,
          "id": 2,
          "sezonName": "1. Sezon"
        }
      ]
    },
    {
      "id": 2,
      "diziName": "Breaking Bad",
      "sezonlar": []
    },
    {
      "id": 3,
      "diziName": "Çarpışma",
      "sezonlar": []
    }
  ]''';

    //arrange

    //act
    List sonuc = JsonHelper.convertResponseToList(localResponse);
    print(sonuc[0].toString());

    //assert
  });

  test("convertJsonObjectsToList", () {
    //setup
    String fireResponse =
        '''{"-N4OjR-VybaIJmXAJo90":{"diziName":"ilk dizi"},"-N4OjU4Lmy_2tTcczSw7":{"diziName":"sonraki dizi"}}''';

    //arrange
    //act
    print(fireResponse);
    // print(s);

    Map sonuc = JsonHelper.convertJsonObjectsToList(fireResponse);
    print(sonuc["-N4OjR-VybaIJmXAJo90"]);
    var di = DiziModel.fromMap(sonuc["-N4OjR-VybaIJmXAJo90"]);
    //print(di.toString()); // Dizi entity ve DiziModel de toString() tanimlamamisim.
    print(di.diziName);

    for (var key in sonuc.keys) {
      var d = DiziModel.fromMap(sonuc[key]);
      print(d.diziName);
    }
  });
}
