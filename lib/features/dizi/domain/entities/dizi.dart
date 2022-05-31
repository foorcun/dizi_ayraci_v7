// {
//   "id":1,
//   "diziName":"Abc dizi",
//   "imgUrl":"assets/images/cat_cafe.png"
// }

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:dizi_ayraci_v7/features/sezon/domain/entites/sezon.dart';

//  # Value equality
// equatable: 2.0.3

// part 'dizi.g.dart'; // example class adi. Hepsi kucuk harf.
// part 'sezon_model.g.dart';
// flutter pub run build_runner build

// @JsonSerializable(explicitToJson: true)
class Dizi extends Equatable {
  int? id;
  String? diziName;
  List<Sezon>? sezonlar = [Sezon(sezonName: "dizi class ici")];
  Dizi({
    this.id,
    this.diziName,
    this.sezonlar,
  });

  // // addSezon(Sezon sezon) {
  // //   this.sezonlar.add(sezon);
  // // }

  // factory Dizi.fromJson(Map<String, dynamic> json) => _$DiziFromJson(json);

  // Map<String, dynamic> toJson() => _$DiziToJson(this);

  @override
  // TODO: implement props
  List<Object> get props => [diziName!, sezonlar!];

  // @override
  // String toString() => 'Dizi(diziName: $diziName, sezonlar: $sezonlar)';
}
