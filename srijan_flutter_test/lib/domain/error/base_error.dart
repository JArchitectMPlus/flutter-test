import 'package:srijan_flutter_test/domain/error/app_error.dart';
import 'package:srijan_flutter_test/domain/mapper/base_layer_data_tranformer.dart';
import 'package:srijan_flutter_test/domain/model/base/error_info.dart';

abstract class BaseError extends BaseLayerDataTransformer<BaseError, AppError>
    implements Exception {
  final ErrorInfo error;
  final Exception cause;

  BaseError({required this.error, required this.cause});

  String getFriendlyMessage();

  logError() {}
}
