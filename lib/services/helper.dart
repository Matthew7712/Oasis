import 'package:flutter/services.dart' as the_bundle;
import '../models/country_model.dart';

class Helper{
  Future<List<Country>> getCountryM() async{
    final data = await the_bundle.rootBundle.loadString("assets/json/country.json");
    final countryList = countryFromJson(data);
    return countryList;
  }

  Future<Country> getCountryById(String id) async{
    final data = await the_bundle.rootBundle.loadString("assets/json/country.json");

    final maleList = countryFromJson(data);

    final sneaker = maleList.firstWhere((country) => country.id == id);
    return sneaker;
  }
}