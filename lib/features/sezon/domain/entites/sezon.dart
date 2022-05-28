// {
//   "sezonId":1,
//   "sezonName":"1. Sezon",
// }

import 'dart:convert';

import 'package:equatable/equatable.dart';

class Sezon extends Equatable {
  int? sezonId;
  String? sezonName;
  Sezon({
    this.sezonId,
    this.sezonName,
  });

  @override
  // TODO: implement props
  List<Object> get props => [sezonId!, sezonName!];

  @override
  String toString() => 'Sezon(sezonId: $sezonId, sezonName: $sezonName)';

  Sezon copyWith({
    int? sezonId,
    String? sezonName,
  }) {
    return Sezon(
      sezonId: sezonId ?? this.sezonId,
      sezonName: sezonName ?? this.sezonName,
    );
  }

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
