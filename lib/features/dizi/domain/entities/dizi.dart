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

class Dizi extends Equatable {
  String? diziName;
  List<Sezon>? sezonlar;
  Dizi({
    this.diziName,
    this.sezonlar,
  });

  @override
  // TODO: implement props
  List<Object> get props => [diziName!, sezonlar!];

  @override
  String toString() => 'Dizi(diziName: $diziName, sezonlar: $sezonlar)';
}
