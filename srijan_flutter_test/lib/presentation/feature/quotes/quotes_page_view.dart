import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';
import 'package:srijan_flutter_test/presentation/base/base_page.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page_model.dart';
import 'package:srijan_flutter_test/presentation/ui/app_stream_builder.dart';
import 'package:srijan_flutter_test/presentation/ui/molecule/quotes/quote_item.dart';
import 'package:srijan_flutter_test/presentation/utils/resource.dart';
import 'package:srijan_flutter_test/presentation/utils/status.dart';

class QuotesPageView extends BasePageViewWidget<QuotesViewModel> {
  const QuotesPageView(super.model, {super.key});

  @override
  Widget build(BuildContext context, model) {
    return AppStreamBuilder<Resource<List<Quotes>>>(
      stream: model.taskListStream,
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
                ? ListView.builder(
                    itemCount: data?.data?.length ?? 0,
                    padding: const EdgeInsets.all(8.0),
                    itemBuilder: (context, index) {
                      return QuoteItem(
                          quoteItem: data!.data![index], index: index);
                    })
                : Center(
                    child: Text(data?.appError?.error.message ?? ''),
                  );
      },
    );
  }
}
