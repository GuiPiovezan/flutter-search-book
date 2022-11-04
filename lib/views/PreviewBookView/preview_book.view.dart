import 'package:flutter/material.dart';
import 'package:flutter_search_book/Model/book.model.dart';
import 'package:flutter_search_book/Model/industry_identifier.model.dart';
import 'package:flutter_search_book/services/book.services.dart';
import 'package:flutter_search_book/views/PdfPreviewer/pdf_previewer.dart';
import 'package:flutter/src/widgets/image.dart' as image;

class PreviewBookView extends StatefulWidget {
  final Book book;

  const PreviewBookView({
    super.key,
    required this.book,
  });

  @override
  State<PreviewBookView> createState() => _PreviewBookViewState();
}

class _PreviewBookViewState extends State<PreviewBookView> {
  String returnToStringISBN(List<IndustryIdentifier> industryIdentifier) {
    List<String> isbn = [];

    for (var element in industryIdentifier) {
      isbn.add(element.identifier.toString());
    }

    return isbn.reduce((value, element) => "$value, $element");
  }

  String returnedYearOfPublisherBook(String date) {
    return date.split("-").first.toString();
  }

  String onFormatDatePublisherBook(String date) {
    List<String> dateSplited = date.split("-");
    if (dateSplited.length > 1) {
      String year, month, day = '';
      year = dateSplited[0];
      month = selectedMonthText(dateSplited[1]);
      day = dateSplited[2];

      return '$day de $month de $year';
    }

    return 'em ${dateSplited[0]}';
  }

  String selectedMonthText(String month) {
    switch (month) {
      case '01':
        return 'janeiro';
      case '02':
        return 'fevereiro';
      case '03':
        return 'março';
      case '04':
        return 'abril';
      case '05':
        return 'maio';
      case '06':
        return 'junho';
      case '07':
        return 'julho';
      case '08':
        return 'agosto';
      case '09':
        return 'setembro';
      case '10':
        return 'outubro';
      case '11':
        return 'novembro';
      case '12':
        return 'dezembro';
      default:
        return 'sem mês';
    }
  }

  String returnedLanguageText(String language) {
    switch (language) {
      case 'pt':
        return 'Português';
      case 'en':
        return 'Inglês';
      default:
        return 'Sem idioma';
    }
  }

  @override
  Widget build(BuildContext context) {
    final BooksService booksService = BooksService();
    booksService.insertBook(widget.book);

    return Scaffold(
      appBar: AppBar(
        title: Text('Volume #${widget.book.id.toString()}'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.book.volumeInfo!.imageLinks != null
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: image.Image(
                                image: NetworkImage(widget
                                    .book.volumeInfo!.imageLinks!.thumbnail!),
                              ),
                            ),
                          )
                        : Container(),
                    widget.book.volumeInfo!.title != null &&
                            widget.book.volumeInfo!.subtitle != null
                        ? Text(
                            '${widget.book.volumeInfo!.title!.toString()}: ${widget.book.volumeInfo!.subtitle!.toString()}',
                            style: const TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          )
                        : Text(
                            widget.book.volumeInfo!.title!.toString(),
                            style: const TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                    Text(
                      "Por ${widget.book.volumeInfo!.authors!.reduce((value, element) => "$value, $element")} • ${returnedYearOfPublisherBook(widget.book.volumeInfo!.publishedDate!)}",
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
                      height: 150,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(25, 10, 10, 10),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
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
                              'ISBN (13, 10): ${returnToStringISBN(widget.book.volumeInfo!.industryIdentifiers!)}',
                              style: textStyle(),
                            ),
                            Text(
                              'Publicação: ${onFormatDatePublisherBook(widget.book.volumeInfo!.publishedDate!)}',
                              style: textStyle(),
                            ),
                            widget.book.volumeInfo!.publisher != null
                                ? Text(
                                    'Editora: ${widget.book.volumeInfo!.publisher}',
                                    style: textStyle(),
                                  )
                                : Container(),
                            Text(
                              'Autor(res): ${widget.book.volumeInfo!.authors!.reduce((value, element) => "$value, $element")}',
                              style: textStyle(),
                            ),
                            Text(
                              'Número de páginas: ${widget.book.volumeInfo!.pageCount}',
                              style: textStyle(),
                            ),
                            Text(
                              'Idioma: ${returnedLanguageText(widget.book.volumeInfo!.language!)}',
                              style: textStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sinopse',
                      style: textStyle(),
                    ),
                    const Divider(),
                    Text(
                      '${widget.book.volumeInfo!.description}',
                      textAlign: TextAlign.justify,
                      style: textStyle(),
                    ),
                  ],
                ),
              ),
              widget.book.accessInfo!.pdf!.isAvailable == true
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                final url =
                                    widget.book.volumeInfo!.infoLink!;

                                openPDF(context, url);
                              },
                              style: const ButtonStyle(
                                textStyle: MaterialStatePropertyAll(
                                    TextStyle(fontSize: 18.0)),
                              ),
                              child: const Text("Mais detalhes"),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle textStyle() => const TextStyle(fontSize: 18.0);

  void openPDF(BuildContext context, String url) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: ((context) => PdfPreviewer(
                url: url,
              )),
        ),
      );
}
