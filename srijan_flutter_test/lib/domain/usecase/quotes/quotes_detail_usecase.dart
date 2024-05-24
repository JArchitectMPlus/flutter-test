import 'package:dartz/dartz.dart';
import 'package:srijan_flutter_test/domain/error/app_error.dart';
import 'package:srijan_flutter_test/domain/error/base_error.dart';
import 'package:srijan_flutter_test/domain/error/network_error.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quote_detail_response.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes_response.dart';
import 'package:srijan_flutter_test/domain/repository/quotes/quotes_repository.dart';
import 'package:srijan_flutter_test/domain/usecase/base/base_usecase.dart';
import 'package:srijan_flutter_test/domain/usecase/base/params.dart';


class QuotesDetailUseCase
    extends BaseUseCase<BaseError, QuotesDetailUseCaseParam, QuotesDetailResponse> {
  final QuotesRepository _quotesRepository;

  QuotesDetailUseCase(this._quotesRepository);

  @override
  Future<Either<NetworkError,QuotesDetailResponse>> execute(
      {required QuotesDetailUseCaseParam params}) {
    return _quotesRepository.getQuoteDetail(id: params.id);
  }

/*  Future<Either<BaseError, CheckInOutResponse>> checkInTask(
      {required CheckInOutParams checkInOutParams}) {
    return _quotesRepository.checkInTask(
        checkInOutParams: CheckInOutParams(
            id: checkInOutParams.id,s
            taskId: checkInOutParams.taskId,
            checkInDate: checkInOutParams.checkInDate,
            checkInTime: checkInOutParams.checkInTime,
            checkOutTime: checkInOutParams.checkOutTime,
            checkOutDate: checkInOutParams.checkOutDate,
            latitude: checkInOutParams.latitude,
            longitude: checkInOutParams.longitude));
  }

  Future<Either<BaseError, CheckInOutResponse>> checkOutTask(
      {required CheckInOutParams checkInOutParams}) {
    return _quotesRepository.checkInTask(
        checkInOutParams: CheckInOutParams(
          id: checkInOutParams.id,
          taskId: checkInOutParams.taskId,
          checkInDate: checkInOutParams.checkInDate,
          checkInTime: checkInOutParams.checkInTime,
          checkOutTime: checkInOutParams.checkOutTime,
          checkOutDate: checkInOutParams.checkOutDate,
          longitude: checkInOutParams.longitude,
          latitude: checkInOutParams.latitude,
        ));
  }*/
}

class QuotesDetailUseCaseParam extends Params {
  String id;

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }

  QuotesDetailUseCaseParam({required this.id});

  @override
  String toString() {
    return 'QuotesDetailUseCaseParam($id';
  }
}
