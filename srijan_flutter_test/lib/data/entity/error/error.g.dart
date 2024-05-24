// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      json['message'] as String? ?? '',
      json['code'] ?? -1,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'message': instance.msg,
      'code': instance.code,
    };
