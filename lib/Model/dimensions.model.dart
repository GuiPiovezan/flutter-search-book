class Dimensions {
  Dimensions({
    this.height,
  });

  String? height;

  Dimensions.fromMap(Map<String, dynamic> map) {
    var dimensionKey = map;
    height = dimensionKey['height'];
  }
}
