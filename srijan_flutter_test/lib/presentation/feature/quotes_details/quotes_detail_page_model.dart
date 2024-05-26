import 'dart:async';


import 'package:rxdart/subjects.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quote_detail_response.dart';
import 'package:srijan_flutter_test/domain/usecase/quotes/quotes_detail_usecase.dart';
import 'package:srijan_flutter_test/presentation/base/base_page_view_model.dart';
import 'package:srijan_flutter_test/presentation/utils/request_manager.dart';
import 'package:srijan_flutter_test/presentation/utils/resource.dart';



class QuotesDetailViewModel extends BasePageViewModel {
  late Timer future;

  final StreamController<bool> _navigateToDashboardController =
      StreamController();
  final PublishSubject<QuotesDetailUseCaseParam> _quoteListRequest = PublishSubject();

  final PublishSubject<Resource<QuotesDetailResponse>> _quoteListResponse = PublishSubject();

  Stream<Resource<QuotesDetailResponse>> get quoteDetailStream => _quoteListResponse.stream;

  Stream<bool> navigateToDashboard() => _navigateToDashboardController.stream;

  final QuotesDetailUseCase _quotesUseCase;

  void navigate() {
    future = Timer(const Duration(seconds: 3), () async {
      _navigateToDashboardController.sink.add(true);
      _navigateToDashboardController.close();
    });
  }

  String? _quoteId;
  String? get quoteId => _quoteId;
  set quoteId(String? val) {
    _quoteId = val;
    notifyListeners();
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
  }

  void getQuoteDetail(id){
    _quoteListRequest.add(QuotesDetailUseCaseParam(id:_quoteId.toString()));
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
