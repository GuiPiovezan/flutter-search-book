import 'package:flutter/material.dart';
import 'package:flutter_search_book/Model/search_result.model.dart';
import 'package:flutter_search_book/components/card_book.component.dart';

class SearchResultPage extends StatelessWidget {
  final SearchResultModel bookList;
  const SearchResultPage({
    super.key,
    required this.bookList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: bookList.books!.length,
        itemBuilder: (context, index) {
          return CardBook(book: bookList.books![index]);
        },
      ),
    );
  }
}
