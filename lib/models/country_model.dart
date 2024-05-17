import 'dart:convert';
import 'package:flutter/material.dart';

List<Country> countryFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

class Country {
  final String address;
  final String id;
  final String name;
  final String description;
  final List<String> imageUrl;
  final List<String> iconUrl;
  final String region;
  final String dateTime;
  final String cost;

  Country({
    required this.id,
    required this.name,
    required this.address,
    this.description = '',
    required this.imageUrl,
    required this.iconUrl,
    required this.region,
    this.dateTime = 'Hello',
    this.cost = '100',
  });

  
  factory Country.fromJson(Map<String, dynamic> json) => Country(
    address: json["address"],
    id: json["id"],
    name: json["name"],
    description: json["description"],
    imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
    iconUrl: List<String>.from(json["iconUrl"].map((x) => x)),
    region: json["region"],
    dateTime: json["dateTime"],
    cost: json["cost"],
  );
}
