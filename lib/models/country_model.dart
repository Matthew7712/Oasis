import 'dart:convert';

List<Country> countryFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

class Country {
  final String address;
  final String id;
  final String name;
  final List<String> imageUrl;
  final String region;

  Country({
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.region,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    address: json["address"],
    id: json["id"],
    name: json["name"],
    imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
    region: json["region"],
  );
}
