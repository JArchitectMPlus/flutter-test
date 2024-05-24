import 'package:json_annotation/json_annotation.dart';

part 'error_extention.g.dart';

@JsonSerializable()
class ErrorExtention {
  final int code;
  final String message;

  ErrorExtention(this.code, this.message);

  factory ErrorExtention.fromJson(Map<String, dynamic> json) =>
      _$ErrorExtentionFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorExtentionToJson(this);
}
