import 'package:flutter_search_book/Model/access_info.model.dart';
import 'package:flutter_search_book/Model/sales_info.model.dart';
import 'package:flutter_search_book/Model/volume_info.model.dart';

class Book {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfoModel? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;

  Book.fromMap(Map<String, dynamic> map) {
    kind = map['kind'];
    id = map['id'];
    etag = map['etag'];
    selfLink = map['selfLink'];
    volumeInfo = VolumeInfoModel.fromMap(map);
    saleInfo = SaleInfo.fromMap(map);
    accessInfo = AccessInfo.fromMap(map);
  }
}
