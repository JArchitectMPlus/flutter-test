import 'dart:async';


import 'package:rxdart/subjects.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quote_detail_response.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes_response.dart';
import 'package:srijan_flutter_test/domain/usecase/quotes/quotes_detail_usecase.dart';
import 'package:srijan_flutter_test/domain/usecase/quotes/quotes_usecase.dart';
import 'package:srijan_flutter_test/presentation/base/base_page_view_model.dart';
import 'package:srijan_flutter_test/presentation/utils/request_manager.dart';
import 'package:srijan_flutter_test/presentation/utils/resource.dart';



class QuotesDetailViewModel extends BasePageViewModel {
  late Timer future;

  final StreamController<bool> _navigateToDashboardController =
      StreamController();
  final PublishSubject<QuotesDetailUseCaseParam> _quoteListRequest = PublishSubject();

  final PublishSubject<Resource<QuotesDetailResponse>> _quoteListResponse = PublishSubject();

  Stream<Resource<QuotesDetailResponse>> get taskListStream =>
      _quoteListResponse.stream;

  Stream<bool> navigateToDashboard() => _navigateToDashboardController.stream;

  final QuotesDetailUseCase _quotesUseCase;

  void navigate() {
    future = Timer(const Duration(seconds: 3), () async {
      _navigateToDashboardController.sink.add(true);
      _navigateToDashboardController.close();
    });
  }

  //Constructor creation
  QuotesDetailViewModel(this._quotesUseCase) {
    _quoteListRequest.listen((value) {
      RequestManager(value,
          createCall: () => _quotesUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        _quoteListResponse.add(event);
      }, onError: (err) {
        print("onError: $err");
      });

    });

    _quoteListRequest.add(QuotesDetailUseCaseParam(id:"R80GBolDfAev"));

  }
 /* final List<QuotesResponse> _quoteList = [];
  List<QuotesResponse> get quoteList => _quoteList;

  set quoteList(List<QuotesResponse>? val) {
    if (val != null) {
      _quoteList.addAll(val);
      notifyListeners();
    }
  }*/

  @override
  void dispose() {
    future.cancel();
    _navigateToDashboardController.close();
    super.dispose();
  }
}
