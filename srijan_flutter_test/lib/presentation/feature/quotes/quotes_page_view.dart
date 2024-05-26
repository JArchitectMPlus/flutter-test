import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srijan_flutter_test/build_context.dart';
import 'package:srijan_flutter_test/presentation/app/navigation/route_paths.dart';
import 'package:srijan_flutter_test/presentation/base/base_page.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quote_detail_args_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quotes_detail_page.dart';
import 'package:srijan_flutter_test/presentation/ui/app_stream_builder.dart';
import 'package:srijan_flutter_test/presentation/utils/resource.dart';
import 'package:srijan_flutter_test/presentation/utils/status.dart';

class QuotesPageView extends BasePageViewWidget<QuotesViewModel> {
  QuotesPageView(ProviderBase<QuotesViewModel> model, {super.key})
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
            if(data.status==Status.loading){
                const CircularProgressIndicator(color: Colors.black,);
            }else {
            model.quoteList = data.data;
            }
          },
          dataBuilder: (context, data) {
            return Builder(builder: (context) => model.quoteList.isEmpty?const SizedBox.shrink()
              :
              ListView.builder(
                  itemCount: model.quoteList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutePaths.quoteDetails,
                            arguments: QuoteDetailCallArgument(quoteId: model.quoteList[index].id, index: index+1));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      (index + 1).toString(),
                                      style: context.bodyLargeBold,
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Expanded(
                                        child: Text(
                                      model.quoteList[index].content.toString(),
                                      style: context
                                          .bodyLargeBold, /*style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),*/
                                    )),
                                  ],
                                ),
                                Text('-${model.quoteList[index].author.toString()}',
                                    style: context.titleMedium),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }));
          },
        ));
  }
}
