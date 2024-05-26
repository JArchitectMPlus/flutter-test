/*

import 'package:flutter/material.dart';
import 'package:srijan_flutter_test/quotes.dart';
import 'package:srijan_flutter_test/build_context.dart';

class QuoteDetailPage extends StatelessWidget {
  const QuoteDetailPage({super.key, required this.index, required this.quotes});

  final int index;
 // final Quotes quotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Quote $index', style: context.titleLargeBold,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(quotes.quote, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 25,),
            Row(
              children: [
                const Expanded(child: Text("Author : ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                Expanded(child: Text(quotes.auther,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                const Expanded(child: Text("Date Added : ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                Expanded(child: Text(quotes.dateAdded,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                const Expanded(child: Text("Date Modified : ",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                Expanded(child: Text(quotes.dateModified,style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),
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
                      itemCount: quotes.tags.length,
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
                          child: Text(quotes.tags[index]),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 15,);
                    },
                    ),
                  ),

*/
/*Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: quotes.tags.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,i){
                          return Text(quotes.tags[i]);
                    }),
                  ),*//*


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

*/
