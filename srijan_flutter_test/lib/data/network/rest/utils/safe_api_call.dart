import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:retrofit/retrofit.dart';
import 'package:srijan_flutter_test/data/network/rest/utils/get_error.dart';
import 'package:srijan_flutter_test/domain/error/network_error.dart';

Future<Either<NetworkError, T>> safeApiCall<T>(Future<T> apiCall) async {
  try {
    final originalResponse = await apiCall;
    final eitherResponse = originalResponse as HttpResponse<dynamic>;
    if (!eitherResponse.isSuccessful()) {
      return Left(getError(apiResponse: eitherResponse.response));
    } else {
      debugPrint("original response $originalResponse");
      return Right(originalResponse);
    }
  } on Exception catch (throwable) {
    switch (throwable.runtimeType) {
      case DioException :
        if (throwable is DioException) {
          switch ((throwable as DioException).type) {
            case DioExceptionType.connectionTimeout:
              //"Connection timeout with API server";
              break;
            case DioExceptionType.sendTimeout:
              //"Receive timeout exception";
              break;
            case DioExceptionType.receiveTimeout:
              //"Receive timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
                return Left(getError(apiResponse: throwable.response!));

              break;
            //"Received invalid status code: ${error.response.statusCode}";
            case DioExceptionType.cancel:
              //"Request to API server was cancelled"
              break;
            case DioExceptionType.unknown:
              return Left(
                NetworkError(
                    message:
                        "Connection to API server failed due to internet connection",
                    httpError: 503,
                    cause: throwable),
              );
            case DioExceptionType.badCertificate:
              // TODO: Handle this case.
              break;
            case DioExceptionType.connectionError:
              // TODO: Handle this case.
              break;
          }
        }

        return Left(
          NetworkError(
              message:
                  "Connection to API server failed due to internet connection",
              httpError: 503,
              cause: throwable),
        );

      case IOException _:
        return Left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));

      default:
        return Left(NetworkError(
            message: throwable.toString(), httpError: 502, cause: throwable));
    }
  }
}

extension RetrofitResponse on HttpResponse {
  /// Returns true if the code is in [200..300), which means the request was successfully received,
  /// understood, and accepted.
  bool isSuccessful() {
    return response.statusCode! >= 200 && response.statusCode! < 300;
  }
}
