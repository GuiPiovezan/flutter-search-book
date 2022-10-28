class ReadingModes {
  ReadingModes({
    this.image,
    this.text,
  });

  bool? image;
  bool? text;

  ReadingModes.fromMap(Map<String, dynamic> map) {
    var readingModesKey = map;
    image = readingModesKey['image'];
    text = readingModesKey['text'];
  }
}
