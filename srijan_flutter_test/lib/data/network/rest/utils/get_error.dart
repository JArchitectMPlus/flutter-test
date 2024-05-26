import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:srijan_flutter_test/domain/error/network_error.dart';
import 'package:srijan_flutter_test/data/entity/error/error.dart';

NetworkError getError({required Response apiResponse}) {
  if (apiResponse.data != null) {
    try {
      final errorResponseEntity = Error.fromJson(apiResponse.data);
      return NetworkError(
          httpError: int.parse(errorResponseEntity.code.toString()),
          message: errorResponseEntity.msg ?? "",
          cause: Exception("Server Response Error"));
    } catch (exception) {
      return NetworkError(
          cause: Exception("Server Response Error"),
          httpError: apiResponse.statusCode!,
          message: apiResponse.statusMessage!);
    }
  } else {
    return NetworkError(
        cause: Exception("Server Response Error"),
        httpError: apiResponse.statusCode!,
        message: apiResponse.statusMessage!);
  }
}
