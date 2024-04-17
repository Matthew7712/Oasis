import 'dart:convert';

List<Country> sneakersFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

class Country {
  final String id;
  final String name;
  final String category;
  final List<String> imageUrl;
  final List<dynamic> sizes;
  final String price;
  final String description;
  final String title;

  Country({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.sizes,
    required this.price,
    required this.description,
    required this.title,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    category: json["category"],
    imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
    sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
    price: json["price"],
    description: json["description"],
    title: json["title"],
  );
}
