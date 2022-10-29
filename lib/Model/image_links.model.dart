class ImageLinks {
  late String? smallThumbnail;
  late String? thumbnail;
  late String? small;
  late String? medium;
  late String? large;
  late String? extraLarge;

  ImageLinks.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> imageLinkKey = map;
    smallThumbnail = imageLinkKey['smallThumbnail'];
    thumbnail = imageLinkKey['thumbnail'];
    small = imageLinkKey['small'];
    medium = imageLinkKey['medium'];
    large = imageLinkKey['large'];
    extraLarge = imageLinkKey['extraLarge'];
  }
}
