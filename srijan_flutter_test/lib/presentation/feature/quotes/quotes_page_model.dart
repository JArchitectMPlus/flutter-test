import 'package:flutter/cupertino.dart';
import 'package:rxdart/subjects.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';
import 'package:srijan_flutter_test/domain/usecase/quotes/quotes_usecase.dart';
import 'package:srijan_flutter_test/presentation/base/base_page_view_model.dart';
import 'package:srijan_flutter_test/presentation/utils/request_manager.dart';
import 'package:srijan_flutter_test/presentation/utils/resource.dart';

class QuotesViewModel extends BasePageViewModel {
  final QuotesUseCase _quotesUseCase;
  final PublishSubject<QuotesUseCaseCaseParam> _quoteListRequest =
      PublishSubject();
  final PublishSubject<Resource<List<Quotes>>> _quoteListResponse =
      PublishSubject();

  Stream<Resource<List<Quotes>>> get taskListStream =>
      _quoteListResponse.stream;

  //Constructor creation
  QuotesViewModel(this._quotesUseCase) {
    _quoteListRequest.listen((value) {
      RequestManager(value,
              createCall: () => _quotesUseCase.execute(params: value))
          .asFlow()
          .listen((event) {
        _quoteListResponse.add(event);
      }, onError: (err) {
        debugPrint("onError: $err");
      });
    });
    getQuotes();
  }

  void getQuotes() {
    _quoteListRequest.add(QuotesUseCaseCaseParam(limit: 50));
  }
}
