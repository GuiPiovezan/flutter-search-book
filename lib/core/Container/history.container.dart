import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_book/Model/book.model.dart';
import 'package:flutter_search_book/components/card_book_history.component.dart';
import 'package:flutter_search_book/components/history_builder.component.dart';
import 'package:flutter_search_book/components/loading.component.dart';
import 'package:flutter_search_book/services/book.services.dart';
import 'package:flutter_search_book/views/Error/error.view.dart';
import 'package:flutter_search_book/views/LoadingPage/Loading.view.dart';

class ContainerHistory extends StatefulWidget {
  const ContainerHistory({Key? key}) : super(key: key);

  @override
  State<ContainerHistory> createState() => _ContainerHistoryState();
}

class _ContainerHistoryState extends State<ContainerHistory> {
  BooksService booksService = BooksService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: booksService.getHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingComponent();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HistoryBuilder(
            historyList: snapshot.data!,
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
