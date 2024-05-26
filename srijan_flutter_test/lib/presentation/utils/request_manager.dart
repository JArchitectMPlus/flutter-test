import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:srijan_flutter_test/domain/constants/error_type.dart';
import 'package:srijan_flutter_test/domain/error/app_error.dart';
import 'package:srijan_flutter_test/domain/error/base_error.dart';
import 'package:srijan_flutter_test/domain/model/base/error_info.dart';
import 'package:srijan_flutter_test/domain/usecase/base/params.dart';
import 'package:srijan_flutter_test/presentation/utils/resource.dart';

class RequestManager<T> {
  final StreamController<Resource<T>> _resource =
      StreamController<Resource<T>>();

  RequestManager(Params params,
      {required Future<Either<BaseError, T>> Function() createCall}) {
    if (params.reloading) {
      _resource.sink.add(Resource.reloading<T>(data: null));
    } else {
      _resource.sink.add(Resource.loading<T>(data: null));
    }
    params.verify().fold(
      (l) async {
        _resource.sink.add(
          Resource.error<T>(error: l, data: null),
        );
        dispose();
      },
      (r) async {
        try {
          Either<BaseError, T> response = await createCall.call();
          response.fold((l) {
            _resource.sink.add(
              Resource.error<T>(
                error: l.transform(),
              ),
            );
            dispose();
          }, (r) {
            _resource.sink.add(
              Resource.success<T>(data: r),
            );
            dispose();
          });
        } catch (ex) {
          _resource.sink.add(Resource.error<T>(
              error: AppError(
            throwable: Exception(),
            error: ErrorInfo(
                message: "Something went wrong! Please try again later."),
            type: ErrorType.unknown,
          )));
          rethrow;
        }
      },
    );
  }

  Stream<Resource<T>> asFlow() => _resource.stream;

  void dispose() {
    _resource.close();
  }
}
