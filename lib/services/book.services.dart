import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_book/Model/book.model.dart';
import 'package:flutter_search_book/Model/epub.model.dart';
import 'package:flutter_search_book/Model/image_links.model.dart';
import 'package:flutter_search_book/Model/industry_identifier.model.dart';
import 'package:flutter_search_book/Model/panelization_summary.model.dart';
import 'package:flutter_search_book/Model/reading_modes.model.dart';
import 'package:flutter_search_book/Model/search_result.model.dart';
import 'package:flutter_search_book/views/Error/error.view.dart';
import 'package:flutter_search_book/views/SearchResultPage/search_result_page.view.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class BooksException implements Exception {
  String message;
  BooksException(this.message);
}

class BooksService extends ChangeNotifier {
  final firestore = FirebaseFirestore.instance;

  Future<SearchResultModel> searchResult(String title) async {
    try {
      title = title.replaceAll("\n", " ");

      var url = Uri.https(
        "www.googleapis.com",
        "/books/v1/volumes",
        {'q': '$title'},
      );
      http.Response response;

      response = await http.get(url);

      Map<String, dynamic> resultingData = await json.decode(response.body);

      if (resultingData == null)
        return throw "Ocorreu um erro, tente novamente!";

      if (resultingData.containsKey('erro'))
        return throw "Nenhum livro encontrado";
      SearchResultModel resultModel = SearchResultModel.fromJson(resultingData);

      return resultModel;
    } catch (e) {
      throw BooksException(
        "Erro ao buscar livro. Server response: " + e.toString(),
      );
    }
  }

  void insertBook(Book book){

    List<Map<String, dynamic>> mapIndustryIdentifiers = _constructorListMapIndustryIdentifier(book);
    Map<String, dynamic> mapReadingModes = _constructorMapReadingModes(book.volumeInfo!.readingModes!);

    try {
      firestore
          .collection("books")
          .doc("volume:${book.id}")
          .set({
        "dateRegistration": DateTime.now(),
        "kind": book.kind,
        "id": book.id,
        "etag": book.etag,
        "selfLink": book.selfLink,
        "volumeInfo": {
          "title": book.volumeInfo!.title,
          "subtitle": book.volumeInfo!.subtitle,
          "authors": book.volumeInfo!.authors!.map((e) => e).toList(),
          "categories": book.volumeInfo!.categories != null ? book.volumeInfo!.categories!.map((e) => e).toList() : null,
          "publisher": book.volumeInfo!.publisher,
          "publishedDate": book.volumeInfo!.publishedDate,
          "description": book.volumeInfo!.description,
          "industryIdentifiers": mapIndustryIdentifiers,
          "readingModes": mapReadingModes,
          "pageCount": book.volumeInfo!.pageCount,
          "printedPageCount": book.volumeInfo!.printedPageCount,
          "printType": book.volumeInfo!.printType,
          "maturityRating": book.volumeInfo!.maturityRating,
          "allowAnonLogging": book.volumeInfo!.allowAnonLogging,
          "contentVersion": book.volumeInfo!.contentVersion,
          "panelizationSummary": _constructorMapPanelizationSummary(book.volumeInfo!.panelizationSummary!),
          "imageLinks": _constructorMapImageLinks(book.volumeInfo!.imageLinks!),
          "language": book.volumeInfo!.language,
          "previewLink": book.volumeInfo!.previewLink,
          "infoLink": book.volumeInfo!.infoLink,
          "canonicalVolumeLink": book.volumeInfo!.canonicalVolumeLink
        },
         "accessInfo": {
           "country": book.accessInfo!.country,
           "viewability": book.accessInfo!.viewability,
           "embeddable": book.accessInfo!.embeddable,
           "publicDomain": book.accessInfo!.publicDomain,
           "textToSpeechPermission": book.accessInfo!.textToSpeechPermission,
           "webReaderLink": book.accessInfo!.webReaderLink,
           "accessViewStatus": book.accessInfo!.accessViewStatus,
           "quoteSharingAllowed": book.accessInfo!.quoteSharingAllowed,
           "epub": _constructorMapEpub(book.accessInfo!.epub!),
           "pdf": _constructorMapPdf(book.accessInfo!.pdf!)
         },
      });
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  List<Map<String, dynamic>> _constructorListMapIndustryIdentifier(Book book) {
    List<Map<String, dynamic>> mapIndustryIdentifiers = [];
    for (var element in book.volumeInfo!.industryIdentifiers!) {
      Map<String, dynamic> map = {
      "identifier": element.identifier,
      "type": element.type
      };

      mapIndustryIdentifiers.add(map);
    }

    return mapIndustryIdentifiers;
  }

  Map<String, dynamic> _constructorMapReadingModes(ReadingModes readingModes){
    return {
      "image": readingModes.image,
      "text": readingModes.text
    };
  }

  Map<String, dynamic> _constructorMapPanelizationSummary(PanelizationSummary panelizationSummary){
    return {
      "containsEpubBubbles": panelizationSummary.containsEpubBubbles,
      "containsImageBubbles": panelizationSummary.containsImageBubbles
    };
  }

  Map<String, dynamic> _constructorMapImageLinks(ImageLinks imageLinks){
    return {
      "smallThumbnail": imageLinks.smallThumbnail,
      "thumbnail": imageLinks.thumbnail,
      "small": imageLinks.small,
      "medium": imageLinks.medium,
      "large": imageLinks.large,
      "extraLarge": imageLinks.extraLarge
    };
  }

  Map<String, dynamic> _constructorMapEpub(Epub epub) {
    return {
      "isAvailable": epub.isAvailable,
      "acsTokenLink": epub.acsTokenLink
    };
  }

  Map<String, dynamic> _constructorMapPdf(Epub pdf) {
    return {
      "isAvailable": pdf.isAvailable,
      "acsTokenLink": pdf.acsTokenLink,
    };
  }
}