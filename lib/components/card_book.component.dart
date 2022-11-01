import 'package:flutter/material.dart';
import 'package:flutter_search_book/Model/book.model.dart';
import 'package:flutter_search_book/views/PreviewBookView/preview_book.view.dart';

class CardBook extends StatefulWidget {
  final Book book;
  const CardBook({
    super.key,
    required this.book,
  });

  @override
  State<CardBook> createState() => _CardBookState();
}

class _CardBookState extends State<CardBook> {
  String isNull(String? text) {
    return text ?? "Sem dados disponiveis";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PreviewBookView(
            book: widget.book,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            Text('Titulo: ${isNull(widget.book.volumeInfo!.title)}'),
            Text(
                'Sub titulo: ${isNull(widget.book.volumeInfo!.subtitle)}'),
            Text('Autor: ${isNull(widget.book.volumeInfo!.authors![0])}'),
          ],
        ),
      ),
    );
  }
}
