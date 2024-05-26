import 'package:flutter/material.dart';

class QuoteTag extends StatelessWidget {
  final String tag;
  const QuoteTag({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(
              Radius.circular(15.0))),
      alignment: Alignment.center,
      child: Text(tag),
    );
  }
}
