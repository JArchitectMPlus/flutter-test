import 'package:json_annotation/json_annotation.dart';
import 'package:srijan_flutter_test/data/entity/error/error.dart';

part 'error_response_entity.g.dart';

@JsonSerializable()
class ErrorResponseEntity {
  Error errors;

  ErrorResponseEntity(this.errors);

  factory ErrorResponseEntity.fromJson(Map<String, dynamic> json) {
    return _$ErrorResponseEntityFromJson(json);
  }
}
