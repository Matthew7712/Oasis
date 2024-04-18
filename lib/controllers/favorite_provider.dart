import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class FavoriteNotifier extends ChangeNotifier{
  List<dynamic> _ids = [];
  List<dynamic> _favorites = [];
  List<dynamic> _fav = [];
  final _favBox = Hive.box('fav_box');
  Future<void> createFavBox(Map<String, dynamic> newFavBox) async {
    await _favBox.add(newFavBox);
    getFavorities();  // обновляем избранное после каждого изменения
  }

  List<dynamic> get ids => _ids;

  set ids(List<dynamic> newIds){
    _ids = newIds;
    notifyListeners();
  }

  List<dynamic> get favorites => _favorites;

  set favorites(List<dynamic> newFav){
    _favorites = newFav;
    notifyListeners();
  }

  getFavorities(){
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key" : key,
        "id" : item["id"]
      };
    }).toList();

    _favorites = favData.toList();
    _ids = _favorites.map((item) async{
      item["id"];
    }).toList();
  }

  List<dynamic> get fav => _fav;

  set fav(List<dynamic> newFav){
    _fav = newFav;
    notifyListeners();
  }

  getAllData(){
    final favData = _favBox.keys.map((key){
      final item = _favBox.get(key);
      return{
        "key" : key,
        "id": item["id"],
        "name" : item["name"],
        "address" : item["address"],
        "region" : item["region"],
        "imageUrl" : item["imageUrl"]
      };
    }).toList();
    _fav = favData.reversed.toList();
  }

  void removeFavorite() {
    notifyListeners();
  }

  Future delete(int key) async {
    await _favBox.delete(key);
    getFavorities();
    notifyListeners();// обновляем избранное после каждого изменения
  }
}
