import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';
import 'package:srijan_flutter_test/domain/usecase/quotes/quotes_detail_usecase.dart';
import 'package:srijan_flutter_test/presentation/base/base_page_view_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quote_detail_args_model.dart';
import 'package:srijan_flutter_test/presentation/utils/request_manager.dart';
import 'package:srijan_flutter_test/presentation/utils/resource.dart';

class QuotesDetailViewModel extends BasePageViewModel {
  final QuoteDetailCallArgument argument;
  final QuotesDetailUseCase _quotesUseCase;
  final PublishSubject<QuotesDetailUseCaseParam> _quoteListRequest =
      PublishSubject();
  final PublishSubject<Resource<Quotes>> _quoteListResponse =
      PublishSubject();

  Stream<Resource<Quotes>> get quoteDetailStream =>
      _quoteListResponse.stream;

  //Constructor creation
  QuotesDetailViewModel(this._quotesUseCase, this.argument) {
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

    getQuoteDetail(argument.quoteId ?? '');
  }

  void getQuoteDetail(String id) {
    _quoteListRequest.add(QuotesDetailUseCaseParam(id: id));
  }
}
