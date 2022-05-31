import 'package:dizi_ayraci_v7/features/dizi/domain/entities/dizi.dart';
import 'package:dizi_ayraci_v7/features/sezon/domain/entites/sezon.dart';

// import 'package:json_annotation/json_annotation.dart';

// part 'dizi_model.g.dart';

// @JsonSerializable(explicitToJson: true)
class DiziModel extends Dizi {
  DiziModel({int? id, String? diziName, List<Sezon>? sezonlar})
      : super(id: id, diziName: diziName, sezonlar: sezonlar);

  // DiziModel({String? diziName}) : super(diziName: diziName);

  // factory DiziModel.fromJson(Map<String, dynamic> json) =>
  //     _$DiziModelFromJson(json);

  // Map<String, dynamic>? toJson() => _$DiziModelToJson(this);

  // factory DiziModel.fromJson({required Map<String, dynamic> json}) {
  //   return DiziModel(
  //     diziName: json['diziName'],
  //     // sezonlar: (json['sezonlar'] as num).toInt(),
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'diziName': diziName,
  //     //  'number': number,
  //   };
  // }

  DiziModel copyWith({
    String? diziName,
    List<Sezon>? sezonlar,
  }) {
    return DiziModel(
      diziName: diziName ?? this.diziName,
      sezonlar: sezonlar ?? this.sezonlar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'diziName': diziName,
      'sezonlar': sezonlar?.map((x) => x.toMap()).toList(),
    };
  }
  // Map<String, dynamic> toMap() {
  //   Map<String, Object> diziDataModel = {};
  //   // List<Map> sezonDataModel = {};
  //   // Sezon sez = Sezon(sezonName: "sezon sez");
  //   // sezonDataModel.add(sez.toMap());
  //   // print("aaaa");
  //   // print(diziDataModel);
  //   // print(sezonDataModel);

  //   // diziDataModel["diziName"] = diziName;
  //   diziDataModel["diziName"] = DiziModel(diziName: "dizdizdiz");
  //   // print(diziDataModel);

  //   // sezonDataModel.addAll(Sezon(sezonName: "sezon1").toMap());

  //   // "diziName": diziName,
  //   // "sezonlar": sezonlar?.map((x) => x?.toMap())?.toList(),r
  //   // "sezonlar": [],
  //   //! diziDataModel["sezonlar"] = sezonDataModel;

  //   // var sss = sezonlar.map((x) => x.toMap()).toList();

  //   // diziDataModel["sezonlar"].add(Sezon(sezonName: "modelden"));
  //   // print(diziDataModel);

  //   var mapp = {
  //     "name": "namimiz",
  //     "age": 23,
  //     "adre": [
  //       {"country": "china", "city": "shanghai"}
  //     ]
  //   };
  //   // mapp["adre"].add

  //   // print(mapp);

  //   return diziDataModel;
  // }

  factory DiziModel.fromMap(Map<String, dynamic> map) {
    return DiziModel(
      diziName: map['diziName'],
      sezonlar: map['sezonlar'] != null
          ? List<Sezon>.from(map['sezonlar']?.map((x) => Sezon.fromMap(x)))
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory DiziModel.fromJson(String source) =>
  //     DiziModel.fromMap(json.decode(source));
}
