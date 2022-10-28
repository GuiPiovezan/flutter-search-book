import 'epub.model.dart';

class AccessInfo {
  AccessInfo({
    this.accessViewStatus,
    this.country,
    this.embeddable,
    this.epub,
    this.pdf,
    this.publicDomain,
    this.quoteSharingAllowed,
    this.textToSpeechPermission,
    this.viewability,
    this.webReaderLink,
  });

  String? accessViewStatus;
  String? country;
  bool? embeddable;
  Epub? epub;
  Epub? pdf;
  bool? publicDomain;
  bool? quoteSharingAllowed;
  String? textToSpeechPermission;
  String? viewability;
  String? webReaderLink;

  AccessInfo.fromMap(Map<String, dynamic> map){
    final Map<String, dynamic> accessInfoKey = map['accessInfo'];
    accessViewStatus = accessInfoKey['accessViewStatus'];
    country = accessInfoKey['country'];
    embeddable = accessInfoKey['embeddable'];
    epub = Epub.fromMap(accessInfoKey['epub']);
    pdf = Epub.fromMap(accessInfoKey['pdf']);
    publicDomain = accessInfoKey['publicDocument'];
    quoteSharingAllowed = accessInfoKey['quoteSharingAllowed'];
    textToSpeechPermission = accessInfoKey['textToSpeechPermission'];
    viewability = accessInfoKey['viewability'];
    webReaderLink = accessInfoKey['webReaderLink'];
  }
}
