class Epub {
  Epub({
    this.isAvailable,
  });

  bool? isAvailable;
  String? acsTokenLink;

  @override
  String toString() {
    return 'Epub{isAvailable: $isAvailable, acsTokenLink: $acsTokenLink}';
  }

  Epub.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> epubKey = map;

    isAvailable = epubKey['isAvailable'];
    acsTokenLink = epubKey['acsTokenLink'];
  }
}
