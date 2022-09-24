import 'package:flutter/material.dart';
import 'package:flutter_search_book/Model/search_result.model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class BooksException implements Exception {
  String message;
  BooksException(this.message);
}

class BooksService extends ChangeNotifier {
  SearchResultModel? model = SearchResultModel();

  booksService() {
    _booksService();
  }

  _booksService() {
    model = (model == null) ? SearchResultModel() : model;
    notifyListeners();
  }

  setResult(String title) async {
    try {
      title = title.replaceAll("\n", " ");

      var url = Uri.https(
        "www.googleapis.com",
        "/books/v1/volumes",
        {'q': '$title'},
      );
      http.Response response;

      response = await http.get(url);

      if (response.statusCode.toString() != "200") {
        return throw response.statusCode.toString();
      }

      Map<String, dynamic> resultingData = await json.decode(response.body);

      if (resultingData.containsKey('erro')) return throw "Livro não encontrado";

      model!.kind = resultingData["kind"];
      model!.totalItems = resultingData["totalItems"];
      model!.books = resultingData["items"];
    } catch (e) {
      throw BooksException(
        "Erro ao buscar livro. Server response: " + e.toString(),
      );
    }
  }

  getBooks() {
    return model;
  }
}
