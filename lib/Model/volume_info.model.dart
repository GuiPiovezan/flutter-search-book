import 'package:flutter_search_book/Model/image_links.model.dart';
import 'package:flutter_search_book/Model/industry_identifier.model.dart';
import 'package:flutter_search_book/Model/panelization_summary.model.dart';
import 'package:flutter_search_book/Model/reading_modes.model.dart';

import 'dimensions.model.dart';

class VolumeInfoModel {
  VolumeInfoModel({
    this.allowAnonLogging,
    this.authors,
    this.canonicalVolumeLink,
    this.contentVersion,
    this.dimensions,
    this.industryIdentifiers,
    this.infoLink,
    this.language,
    this.maturityRating,
    this.pageCount,
    this.panelizationSummary,
    this.previewLink,
    this.printType,
    this.printedPageCount,
    this.publishedDate,
    this.publisher,
    this.readingModes,
    this.subtitle,
    this.title,
  });

  bool? allowAnonLogging;
  List<String>? authors;
  String? canonicalVolumeLink;
  String? contentVersion;
  Dimensions? dimensions;
  String? description;
  List<IndustryIdentifier>? industryIdentifiers;
  String? infoLink;
  String? language;
  String? maturityRating;
  int? pageCount;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? previewLink;
  String? printType;
  int? printedPageCount;
  String? publishedDate;
  String? publisher;
  ReadingModes? readingModes;
  String? subtitle;
  String? title;

  VolumeInfoModel.fromMap(Map<String, dynamic> map) {
    final Map<String, dynamic> volumeInfoKey = map['volumeInfo'];
    allowAnonLogging = volumeInfoKey['allowAnonLogging'];
    authors = onMountedAuthors(map);
    canonicalVolumeLink = volumeInfoKey['canonicalVolumeLink'];
    contentVersion = volumeInfoKey['contentVersion'];
    dimensions = verifyNullabeDimensionKey(map);
    description = volumeInfoKey['description'] ?? null;
    industryIdentifiers = onMountedIndustryIdentifiers(map);
    infoLink = volumeInfoKey['infoLink'];
    language = volumeInfoKey['language'];
    maturityRating = volumeInfoKey['maturityRating'];
    pageCount = volumeInfoKey['pageCount'];
    panelizationSummary = verifyNullabePanelizationSummaryKey(map);
    imageLinks = verifyNullabeImageLinks(map);
    previewLink = volumeInfoKey['previewLink'];
    printType = volumeInfoKey['printType'];
    printedPageCount = volumeInfoKey['printedPageCount'];
    publishedDate = volumeInfoKey['publishedDate'];
    publisher = volumeInfoKey['publisher'];
    readingModes = ReadingModes.fromMap(volumeInfoKey['readingModes']);
    subtitle = volumeInfoKey['subtitle'];
    title = volumeInfoKey['title'];
  }

  List<IndustryIdentifier> onMountedIndustryIdentifiers(
      Map<String, dynamic> map) {
    List<IndustryIdentifier> industryIdentifiers = [];
    map['volumeInfo']['industryIdentifiers'].forEach((item) {
      industryIdentifiers.add(IndustryIdentifier.fromMap(item));
    });

    return industryIdentifiers;
  }

  Dimensions? verifyNullabeDimensionKey(Map<String, dynamic> map) {
    return map['volumeInfo']['dimensions'] != null
        ? Dimensions.fromMap(map['volumeInfo']['dimensions'])
        : null;
  }

  PanelizationSummary? verifyNullabePanelizationSummaryKey(
      Map<String, dynamic> map) {
    return map['volumeInfo']['panelizationSummary'] != null
        ? PanelizationSummary.fromMap(map['volumeInfo']['panelizationSummary'])
        : null;
  }

  ImageLinks? verifyNullabeImageLinks(Map<String, dynamic> map) {
    return map['volumeInfo']['imageLinks'] != null
        ? ImageLinks.fromMap(map['volumeInfo']['imageLinks'])
        : null;
  }

  List<String>? onMountedAuthors(Map<String, dynamic> map) {
    authors = [];
    map['volumeInfo']['authors'].forEach((item) {
      authors!.add(item);
    });

    return authors;
  }
}
