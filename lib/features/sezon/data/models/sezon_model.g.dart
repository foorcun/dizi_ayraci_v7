// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sezon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SezonModel _$SezonModelFromJson(Map<String, dynamic> json) => SezonModel(
      sezonName: json['sezonName'] as String?,
    )..sezonId = json['sezonId'] as int?;

Map<String, dynamic> _$SezonModelToJson(SezonModel instance) =>
    <String, dynamic>{
      'sezonId': instance.sezonId,
      'sezonName': instance.sezonName,
    };
