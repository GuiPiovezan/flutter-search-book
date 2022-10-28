import 'package:flutter_search_book/Model/access_info.model.dart';
import 'package:flutter_search_book/Model/sales_info.model.dart';
import 'package:flutter_search_book/Model/volume_info.model.dart';

class RootObject {
  RootObject({
    this.accessInfo,
    this.etag,
    this.id,
    this.kind,
    this.saleInfo,
    this.selfLink,
    this.volumeInfo,
  });

  AccessInfo? accessInfo;
  String? etag;
  String? id;
  String? kind;
  SaleInfo? saleInfo;
  String? selfLink;
  VolumeInfoModel? volumeInfo;
}
