import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_book/Model/book.model.dart';

class CardBookHistory extends StatelessWidget {
  final Book? book;
  const CardBookHistory({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Image(
            height: 120,
            image: NetworkImage(book!.volumeInfo!.imageLinks!.smallThumbnail!),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                book!.volumeInfo!.title != null &&
                        book!.volumeInfo!.subtitle != null
                    ? Text(
                        '${book!.volumeInfo!.title!.toString()}\n${book!.volumeInfo!.subtitle!.toString()}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        book!.volumeInfo!.title!.toString(),
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
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
