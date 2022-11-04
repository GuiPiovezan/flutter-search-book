class SaleInfo {
  SaleInfo({
    this.country,
    this.isEbook,
    this.saleability,
  });

  String? country;
  bool? isEbook;
  String? saleability;

  SaleInfo.fromMap(Map<String, dynamic> map){
    final Map<String, dynamic> saleInfoKey = map['saleInfo'];
    country = saleInfoKey['country'] ?? null;
    isEbook = saleInfoKey['isEbook'] ?? null;
    saleability = saleInfoKey['saleability'] ?? null;
  }
}
