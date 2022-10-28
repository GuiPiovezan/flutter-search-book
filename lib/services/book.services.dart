import 'package:flutter_search_book/Model/book.model.dart';

class BooksService {

  Book onMountedBooks(Map<String, dynamic> map){
    return Book.fromMap(map);
  }
}