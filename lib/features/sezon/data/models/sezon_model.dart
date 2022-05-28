import 'package:dizi_ayraci_v7/features/sezon/domain/entites/sezon.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sezon_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SezonModel extends Sezon {
  // SezonModel({String? diziName, List<Sezon>? sezonlar})
  //     : super(diziName: diziName, sezonlar: sezonlar);

  SezonModel({String? sezonName}) : super(sezonName: sezonName);

  // factory SezonModel.fromJson(Map<String, dynamic> json) =>
  //     _$SezonModelFromJson(json);

  // Map<String, dynamic>? toJson() => _$SezonModelToJson(this);

  // factory SezonModel.fromJson({required Map<String, dynamic> json}) {
  //   return SezonModel(
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
}
