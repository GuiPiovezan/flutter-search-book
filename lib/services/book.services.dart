import 'package:flutter/material.dart';
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
}
