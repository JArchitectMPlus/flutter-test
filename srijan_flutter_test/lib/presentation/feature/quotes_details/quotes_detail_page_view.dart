import 'package:flutter/material.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';
import 'package:srijan_flutter_test/presentation/base/base_page.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quotes_detail_page_model.dart';
import 'package:srijan_flutter_test/presentation/ui/app_stream_builder.dart';
import 'package:srijan_flutter_test/presentation/ui/molecule/quotes/quote_detail.dart';
import 'package:srijan_flutter_test/presentation/utils/resource.dart';
import 'package:srijan_flutter_test/presentation/utils/status.dart';

class QuotesDetailPageView extends BasePageViewWidget<QuotesDetailViewModel> {
  const QuotesDetailPageView(super.model, this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context, model) {
    return AppStreamBuilder<Resource<Quotes>>(
      stream: model.quoteDetailStream,
      initialData: Resource.none(),
      onData: (value) {
        if (value.status == Status.error) {
          model.showToastWithError(value.appError);
        }
      },
      dataBuilder: (context, data) {
        return data?.status == Status.loading
            ? const Center(child: CircularProgressIndicator())
            : data?.status == Status.success
                ? SingleChildScrollView(child: QuoteDetail(data: data?.data))
                :  Center(
                    child: Text(data?.appError?.error.message ?? ''),
                  );
      },
    );
  }
}
