// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseEntity _$ErrorResponseEntityFromJson(Map<String, dynamic> json) =>
    ErrorResponseEntity(
      Error.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorResponseEntityToJson(
        ErrorResponseEntity instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };
