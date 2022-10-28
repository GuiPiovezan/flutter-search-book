class Epub {
  Epub({
    this.isAvailable,
  });

  bool? isAvailable;

  Epub.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> epubKey = map;
    isAvailable = epubKey['isAvailable'];
  }
}
