import 'package:dartz/dartz.dart';
import 'package:srijan_flutter_test/domain/error/app_error.dart';

abstract class Params {
  final bool reloading;

  Params({this.reloading = false});

  Either<AppError, bool> verify();
}
