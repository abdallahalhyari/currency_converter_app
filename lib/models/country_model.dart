class CountryModel {
  final String id;
  final String name;
  final String alpha3;
  final String currencyId;
  final String currencyName;
  final String currencySymbol;

  CountryModel({
    required this.id,
    required this.name,
    required this.alpha3,
    required this.currencyId,
    required this.currencyName,
    required this.currencySymbol,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'],
      alpha3: json['alpha3'],
      currencyId: json['currencyId'],
      currencyName: json['currencyName'],
      currencySymbol: json['currencySymbol'],
    );
  }
}