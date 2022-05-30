// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dizi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dizi _$DiziFromJson(Map<String, dynamic> json) => Dizi(
      id: json['id'] as int?,
      diziName: json['diziName'] as String?,
      sezonlar: (json['sezonlar'] as List<dynamic>?)
          ?.map((e) => Sezon.fromJson(e as String))
          .toList(),
    );

Map<String, dynamic> _$DiziToJson(Dizi instance) => <String, dynamic>{
      'id': instance.id,
      'diziName': instance.diziName,
      'sezonlar': instance.sezonlar?.map((e) => e.toJson()).toList(),
    };
