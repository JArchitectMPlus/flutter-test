import 'package:srijan_flutter_test/domain/constants/error_type.dart';
import 'package:srijan_flutter_test/domain/error/app_error.dart';
import 'package:srijan_flutter_test/domain/error/base_error.dart';
import 'package:srijan_flutter_test/domain/model/base/error_info.dart';

class NetworkError extends BaseError {
  NetworkError({
    required int httpError,
    String message = "",
    required super.cause,
  }) : super(error: ErrorInfo(code: httpError, message: message));

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (error.code) {
      case 503:
        return AppError(
            error: error, throwable: cause, type: ErrorType.netDefaultError);

      case 504:
        return AppError(
            throwable: cause, error: error, type: ErrorType.netServerMessage);

      case 502:
        return AppError(
            throwable: cause, error: error, type: ErrorType.netServerMessage);

      case 404:
        return AppError(
            throwable: cause, error: error, type: ErrorType.netServerMessage);

      default:
        return AppError(
            throwable: cause, error: error, type: ErrorType.unknown);
    }
  }
}
