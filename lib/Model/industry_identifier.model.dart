class IndustryIdentifier {
  IndustryIdentifier({
    this.identifier,
    this.type,
  });

  String? identifier;
  String? type;

  IndustryIdentifier.fromMap(Map<String, dynamic> map) {
    Map<String, dynamic> industryIdentifierKey = map;
    identifier = industryIdentifierKey['identifier'];
    type = industryIdentifierKey['type'];
  }
}
