import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable()
class Error {
  @JsonKey(name: "message", defaultValue: "")
  final String? msg;
  @JsonKey(name: "code", defaultValue: -1)
  final dynamic code;

  Error(this.msg, this.code);

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
