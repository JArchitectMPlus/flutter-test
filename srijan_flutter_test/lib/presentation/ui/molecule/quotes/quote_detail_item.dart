import 'package:flutter/material.dart';

class QuoteDetailItem extends StatelessWidget {
  final String title;
  final String description;

  const QuoteDetailItem(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Text(
                description,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              )),
        ],
      ),
    );
  }
}