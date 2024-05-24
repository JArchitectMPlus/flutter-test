// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_extention.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorExtention _$ErrorExtentionFromJson(Map<String, dynamic> json) =>
    ErrorExtention(
      (json['code'] as num).toInt(),
      json['message'] as String,
    );

Map<String, dynamic> _$ErrorExtentionToJson(ErrorExtention instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
