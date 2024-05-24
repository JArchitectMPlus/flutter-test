import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srijan_flutter_test/build_context.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quote_detail_response.dart';
import 'package:srijan_flutter_test/presentation/base/base_page.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quotes_detail_page_model.dart';
import 'package:srijan_flutter_test/presentation/ui/app_stream_builder.dart';
import 'package:srijan_flutter_test/presentation/utils/resource.dart';
import 'package:srijan_flutter_test/presentation/utils/status.dart';
import 'package:srijan_flutter_test/quote_detail_page.dart';
import 'package:srijan_flutter_test/quotes.dart';

class QuotesDetailPageView extends BasePageViewWidget<QuotesDetailViewModel> {
  QuotesDetailPageView(ProviderBase<QuotesDetailViewModel> model, {super.key})
      : super(model);

  @override
  Widget build(BuildContext context, model) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            "Home",
            style: context.titleLargeBold,
          ),
        ),
        body: AppStreamBuilder(
          stream: model.taskListStream,
          initialData: Resource.none(),
          onData: (data) {
            //handleProgressIndicator(context, data.status);
          },
          dataBuilder: (context, data) {
            QuotesDetailResponse response = data!.data;
            return Column(
              children: [
                Text(response.author.toString())
              ],
            );
          },
        ));
  }

/* @override
  Widget build(BuildContext context, model) {
    return const Center(
        child: Hero(
      tag: "logo",
      child: Text(
        'Srijan App',
        style: TextStyle(color: Colors.black),
      ),
    ));
  }*/
}
