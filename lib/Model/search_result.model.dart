import 'package:flutter_search_book/Model/book.model.dart';

class SearchResultModel {
  String? kind;
  int? totalItems;
  List<Book>? books;

  SearchResultModel({
    this.kind,
    this.totalItems,
    this.books,
  });

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    books = [];
    for (var element in json['items']) {
      books!.add(Book.fromMap(element));
    }
  }
}
