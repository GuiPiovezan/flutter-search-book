class SearchResultModel {
  String? kind;
  int? totalItems;
  List<dynamic>? books;

  SearchResultModel({
    this.kind,
    this.totalItems,
    this.books,
  });

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    books = json['items'];
  }
}
