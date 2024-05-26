import 'package:dartz/dartz.dart';
import 'package:srijan_flutter_test/domain/error/base_error.dart';
import 'package:srijan_flutter_test/domain/usecase/base/params.dart';

abstract class BaseUseCase<E extends BaseError, P extends Params, T> {
  Future<Either<E, T>> execute({required P params});
}
