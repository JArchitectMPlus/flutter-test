import 'package:flutter/material.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';
import 'package:srijan_flutter_test/generated/l10n.dart';
import 'package:srijan_flutter_test/presentation/app/navigation/route_paths.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quote_detail_args_model.dart';

class QuoteItem extends StatelessWidget {
  final Quotes quoteItem;
  final int index;

  const QuoteItem({super.key, required this.quoteItem, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutePaths.quoteDetails,
            arguments: QuoteDetailCallArgument(
                quoteId: quoteItem.id, index: index + 1));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (index + 1).toString(),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Text(
                    quoteItem.content ?? '',
                  )),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(S.of(context).author(quoteItem.author ?? '')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
