import 'package:flutter/material.dart';
import 'package:flutter_search_book/Model/book.model.dart';
import 'package:flutter_search_book/components/card_book_history.component.dart';

class HistoryBuilder extends StatefulWidget {
  final List<Book> historyList;
  const HistoryBuilder({
    super.key,
    required this.historyList,
  });

  @override
  State<HistoryBuilder> createState() => _HistoryBuilderState();
}

class _HistoryBuilderState extends State<HistoryBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 90),
      child: ListView.builder(
        itemCount: widget.historyList.length,
        itemBuilder: (_, index) {
          return CardBookHistory(
            book: widget.historyList[index],
          );
        },
      ),
    );
  }
}
