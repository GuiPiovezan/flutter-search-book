import 'package:flutter/material.dart';

class CardBook extends StatefulWidget {
  final Map<String, dynamic> model;
  const CardBook({
    super.key,
    required this.model,
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
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Column(
        children: [
          Text('Titulo: ${isNull(widget.model['volumeInfo']['title'])}'),
          Text('Sub titulo: ${isNull(widget.model['volumeInfo']['subtitle'])}'),
          Text('Autor: ${widget.model['volumeInfo']['authors'][0]}'),
        ],
      ),
    );
  }
}
