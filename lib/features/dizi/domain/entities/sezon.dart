// {
//   "sezonId":1,
//   "sezonName":"1. Sezon",
// }

import 'dart:convert';

import 'package:dizi_ayraci_v7/core/common_domain/dizi_ayraci/base_entity.dart';
import 'package:equatable/equatable.dart';

// class Sezon extends Equatable {
class Sezon extends BaseEntity<int?> {
  int? sezonId;
  String? sezonName;
  Sezon({
    // this.sezonId,
    int? sezonId,
    this.sezonName,
  }){
    super.id =sezonId;
  }

  // @override
  // // TODO: implement props
  // List<Object> get props => [sezonId!, sezonName!];

  @override
  String toString() => 'Sezon(sezonId: $sezonId, sezonName: $sezonName)';

  // Sezon copyWith({
  //   int? sezonId,
  //   String? sezonName,
  // }) {
  //   return Sezon(
  //     sezonId: sezonId ?? this.sezonId,
  //     sezonName: sezonName ?? this.sezonName,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'sezonId': sezonId,
      'sezonName': sezonName,
    };
  }

  factory Sezon.fromMap(Map<String, dynamic> map) {
    return Sezon(
      sezonId: map['sezonId']?.toInt(),
      sezonName: map['sezonName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Sezon.fromJson(String source) => Sezon.fromMap(json.decode(source));
}
