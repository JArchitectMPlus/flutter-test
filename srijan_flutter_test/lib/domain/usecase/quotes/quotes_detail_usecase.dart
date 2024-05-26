import 'package:dartz/dartz.dart';
import 'package:srijan_flutter_test/domain/constants/error_type.dart';
import 'package:srijan_flutter_test/domain/error/app_error.dart';
import 'package:srijan_flutter_test/domain/error/base_error.dart';
import 'package:srijan_flutter_test/domain/error/network_error.dart';
import 'package:srijan_flutter_test/domain/model/base/error_info.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';
import 'package:srijan_flutter_test/domain/repository/quotes/quotes_repository.dart';
import 'package:srijan_flutter_test/domain/usecase/base/base_usecase.dart';
import 'package:srijan_flutter_test/domain/usecase/base/params.dart';

class QuotesDetailUseCase
    extends BaseUseCase<BaseError, QuotesDetailUseCaseParam, Quotes> {
  final QuotesRepository _quotesRepository;

  QuotesDetailUseCase(this._quotesRepository);

  @override
  Future<Either<NetworkError, Quotes>> execute(
      {required QuotesDetailUseCaseParam params}) {
    return _quotesRepository.getQuoteDetail(id: params.id);
  }
}

class QuotesDetailUseCaseParam extends Params {
  final String id;

  QuotesDetailUseCaseParam({required this.id});

  @override
  Either<AppError, bool> verify() {
    if (id.isEmpty) {
      return Left(AppError(
          throwable: Exception(),
          error: ErrorInfo(message: ''),
          type: ErrorType.emptyQuoteId));
    }
    return const Right(true);
  }
}
