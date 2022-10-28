import 'package:flutter/material.dart';
import 'package:flutter_search_book/Model/book.model.dart';
import 'package:flutter_search_book/Model/industry_identifier.model.dart';
import 'package:flutter_search_book/services/book.services.dart';

class PreviewBookView extends StatelessWidget {
  Map<String, dynamic> model;

  PreviewBookView({super.key, required this.model});

  final BooksService _booksService = BooksService();

  String returnToStringISBN(List<IndustryIdentifier> industryIdentifier) {
    List<String> isbn = [];

    for (var element in industryIdentifier) {
      isbn.add(element.identifier.toString());
    }

    return isbn.reduce((value, element) => "$value, $element");
  }

  @override
  Widget build(BuildContext context) {
    Book book = _booksService.onMountedBooks(model);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.volumeInfo!.title!.toString(),
                  style: const TextStyle(
                      fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Por ${book.volumeInfo!.authors!.reduce((value, element) => "$value, $element")} • ${book.volumeInfo!.publishedDate}",
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
              bottom: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Sobre esta edição',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(25, 10, 10, 10),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    //color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'ISBN: ${returnToStringISBN(book.volumeInfo!.industryIdentifiers!)}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
