import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class TicketNotifier extends ChangeNotifier{
  List<dynamic> _its = [];
  List<dynamic> _tickets = [];
  List<dynamic> _ticket = [];
  final _historyBox = Hive.box('ticket_box');
  Future<void> createTicketBox(Map<String, dynamic> newFavBox) async {
    await _historyBox.add(newFavBox);
    getHistories();  // обновляем избранное после каждого изменения
  }

  List<dynamic> get ids => _its;

  set ids(List<dynamic> newIds){
    _its = newIds;
    notifyListeners();
  }

  List<dynamic> get histories => _tickets;

  set histories(List<dynamic> newFav){
    _tickets = newFav;
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

    _tickets = historyData.toList();
    _its = _tickets.map((item) async{
      item["id"];
    }).toList();
  }

  List<dynamic> get tick => _ticket;

  set tick(List<dynamic> newFav){
    _ticket = newFav;
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
        "dateTime": item["dateTime"],
        "cost" : item["cost"],
      };
    }).toList();
    _ticket = favData.reversed.toList();
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
