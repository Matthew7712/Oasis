import 'dart:convert';

List<Hotel> hotelFromJson(String str) => List<Hotel>.from(json.decode(str).map((x) => Hotel.fromJson(x)));

class Hotel {
  final String address;
  final String id;
  final String name;
  final List<String> imageUrl;
  final String region;

  Hotel({
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.region,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
    address: json["address"],
    id: json["id"],
    name: json["name"],
    imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
    region: json["region"],
  );
}
