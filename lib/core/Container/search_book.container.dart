import 'package:flutter/material.dart';
import 'package:flutter_search_book/Model/search_result.model.dart';
import 'package:flutter_search_book/services/book.services.dart';
import 'package:flutter_search_book/views/Error/error.view.dart';
import 'package:flutter_search_book/views/LoadingPage/Loading.view.dart';
import 'package:flutter_search_book/views/SearchResultPage/search_result_page.view.dart';

class SearchBookContainer extends StatefulWidget {
  final String text;
  const SearchBookContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<SearchBookContainer> createState() => _SearchBookContainerState();
}

class _SearchBookContainerState extends State<SearchBookContainer> {
  BooksService booksService = BooksService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SearchResultModel>(
      future: booksService.searchResult(widget.text),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return SearchResultPage(
            bookList: snapshot.data!,
          );
        }

        if (snapshot.hasError) {
          return ErrorPage(
            error: (snapshot.error as BooksException).message,
          );
        }

        return const Center(
          child: Text("Algo deu errado"),
        );
      },
    );
  }
}
