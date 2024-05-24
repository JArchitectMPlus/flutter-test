import 'package:dartz/dartz.dart';
import 'package:srijan_flutter_test/domain/error/app_error.dart';
import 'package:srijan_flutter_test/domain/error/base_error.dart';
import 'package:srijan_flutter_test/domain/error/network_error.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes_response.dart';
import 'package:srijan_flutter_test/domain/repository/quotes/quotes_repository.dart';
import 'package:srijan_flutter_test/domain/usecase/base/base_usecase.dart';
import 'package:srijan_flutter_test/domain/usecase/base/params.dart';


class QuotesUseCase
    extends BaseUseCase<BaseError, QuotesUseCaseCaseParam, List<QuotesResponse>> {
  final QuotesRepository _quotesRepository;

  QuotesUseCase(this._quotesRepository);

  @override
  Future<Either<NetworkError,List<QuotesResponse>>> execute(
      {required QuotesUseCaseCaseParam params}) {
    return _quotesRepository.getQuotes(limit: 50);
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

class QuotesUseCaseCaseParam extends Params {
  String limit;

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }

  QuotesUseCaseCaseParam({required this.limit});

  @override
  String toString() {
    return 'QuotesUseCaseCaseParam($limit';
  }
}
