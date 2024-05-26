import 'package:flutter/material.dart';
import 'package:srijan_flutter_test/build_context.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quote_detail_response.dart';
import 'package:srijan_flutter_test/presentation/base/base_page.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quotes_detail_page_model.dart';
import 'package:srijan_flutter_test/presentation/ui/app_stream_builder.dart';
import 'package:srijan_flutter_test/presentation/utils/resource.dart';

class QuotesDetailPageView extends BasePageViewWidget<QuotesDetailViewModel> {
   const QuotesDetailPageView(super.model, this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context, model) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            'Quote ${index}',
            style: context.titleLargeBold,
          ),
        ),
        body: AppStreamBuilder(
          stream: model.quoteDetailStream,
          initialData: Resource.none(),
          onData: (data) {
          },
          dataBuilder: (context, data) {
            QuotesDetailResponse response = data!.data;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(response.content.toString(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 25,),
                  Row(
                    children: [
                      const Expanded(child: Text("Author : ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                      Expanded(child: Text(response.author.toString(),style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const Expanded(child: Text("Date Added : ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                      Expanded(child: Text(response.dateAdded.toString(),style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      const Expanded(child: Text("Date Modified : ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                      Expanded(child: Text(response.dateModified.toString(),style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Flexible(
                    child: Row(
                      children: [
                        const Text("Tags : ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 20,),
                        SizedBox( // Horizontal ListView
                          height: 50,
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: response.tags != null ?response.tags!.length : 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15.0))
                                ),
                                alignment: Alignment.center,
                                child: Text(response.tags != null ? response.tags![index].toString() : ""),
                              );
                            }, separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 15,);
                          },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
