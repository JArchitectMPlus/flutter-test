import 'package:flutter/material.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';
import 'package:srijan_flutter_test/generated/l10n.dart';
import 'package:srijan_flutter_test/presentation/ui/molecule/quotes/quote_detail_item.dart';
import 'package:srijan_flutter_test/presentation/ui/molecule/quotes/quote_tag.dart';

class QuoteDetail extends StatelessWidget {
  final Quotes? data;

  const QuoteDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            data?.content ?? '',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          QuoteDetailItem(
              title: S.of(context).authorName, description: data?.author ?? ''),
          QuoteDetailItem(
              title: S.of(context).dateAdded,
              description: data?.dateAdded ?? ''),
          QuoteDetailItem(
              title: S.of(context).dateModified,
              description: data?.dateModified ?? ''),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                S.of(context).tags,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 8,
              ),
              Wrap(
                runSpacing: 8,
                spacing: 8,
                children:
                    data?.tags?.map((tag) => QuoteTag(tag: tag)).toList() ?? [],
              ),
            ],
          )
        ],
      ),
    );
  }
}
