import 'package:dartz/dartz.dart';
import 'package:srijan_flutter_test/domain/error/app_error.dart';
import 'package:srijan_flutter_test/domain/error/base_error.dart';
import 'package:srijan_flutter_test/domain/error/network_error.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';
import 'package:srijan_flutter_test/domain/repository/quotes/quotes_repository.dart';
import 'package:srijan_flutter_test/domain/usecase/base/base_usecase.dart';
import 'package:srijan_flutter_test/domain/usecase/base/params.dart';

class QuotesUseCase extends BaseUseCase<BaseError, QuotesUseCaseCaseParam,
    List<Quotes>> {
  final QuotesRepository _quotesRepository;

  QuotesUseCase(this._quotesRepository);

  @override
  Future<Either<NetworkError, List<Quotes>>> execute(
      {required QuotesUseCaseCaseParam params}) {
    return _quotesRepository.getQuotes(limit: params.limit??50);
  }
}

class QuotesUseCaseCaseParam extends Params {
  final int? limit;
  QuotesUseCaseCaseParam({this.limit});
  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}
