import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HistoryNotifier extends ChangeNotifier{
  List<dynamic> _ihs = [];
  List<dynamic> _histories = [];
  List<dynamic> _history = [];
  final _historyBox = Hive.box('history_box');
  Future<void> createHistoryBox(Map<String, dynamic> newFavBox) async {
    await _historyBox.add(newFavBox);
    getHistories();  // обновляем избранное после каждого изменения
  }

  List<dynamic> get ids => _ihs;

  set ids(List<dynamic> newIds){
    _ihs = newIds;
    notifyListeners();
  }

  List<dynamic> get histories => _histories;

  set histories(List<dynamic> newFav){
    _histories = newFav;
    notifyListeners();
  }

  getHistories(){
    final historyData = _historyBox.keys.map((key) {
      final item = _historyBox.get(key);
      return {
        "key" : key,
        "id" : item["id"]
      };
    }).toList();

    _histories = historyData.toList();
    _ihs = _histories.map((item) async{
      item["id"];
    }).toList();
  }

  List<dynamic> get his => _history;

  set his(List<dynamic> newFav){
    _history = newFav;
    notifyListeners();
  }

  getAllData(){
    final favData = _historyBox.keys.map((key){
      final item = _historyBox.get(key);
      return{
        "key" : key,
        "id": item["id"],
        "name" : item["name"],
        "address" : item["address"],
        "region" : item["region"],
        "description" : item["description"],
        "imageUrl" : item["imageUrl"],
        "date": item["date"],
        "cost" : item["cost"],
      };
    }).toList();
    _history = favData.reversed.toList();
  }

  void removeFavorite() {
    notifyListeners();
  }

  Future delete(int key) async {
    await _historyBox.delete(key);
    getHistories();
    notifyListeners();// обновляем избранное после каждого изменения
  }
}
