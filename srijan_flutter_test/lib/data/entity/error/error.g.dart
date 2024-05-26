// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      json['statusMessage'] as String? ?? '',
      json['statusCode'] ?? -1,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'statusMessage': instance.msg,
      'statusCode': instance.code,
    };
