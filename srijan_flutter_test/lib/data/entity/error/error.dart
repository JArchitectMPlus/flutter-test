import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable()
class Error {
  @JsonKey(name: "statusMessage", defaultValue: "")
  final String? msg;
  @JsonKey(name: "statusCode", defaultValue: -1)
  final dynamic code;

  Error(this.msg, this.code);

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
