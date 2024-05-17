import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../controllers/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../services/appcolors.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final _favBox = Hive.box('fav_box');
  int counter = 1;
  void doNothing(int key) async{
    await _favBox.delete(key);
  }
  Timer? _timer;
  void startTimer() {
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pop();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var favoritesNotifier = Provider.of<FavoriteNotifier>(context);
    favoritesNotifier.getAllData();
    List<dynamic> cart = [];
    final cartData = _favBox.keys.map((key){
      final item = _favBox.get(key);
      return {
        "key" : key,
        "id" : item['id'],
        "name" : item['name'],
        "address" : item['address'],
        "region" : item['region'],
        "imageUrl" : item['imageUrl'],
        "cost" : item['cost'],
        "counter" : item['counter']
      };
    }).toList();
    cart = cartData.reversed.toList();

    void incrementFunction(Map<String, dynamic> country){
      setState(() {
        country['counter']++;
      });
      print(country['counter']);
    }

    void decrementFunction(Map<String, dynamic> country){
      setState(() {
        if (country['counter'] > 1) {
          country['counter']--;
        }
      });
      print(country['counter']);
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: Dimensions.vertical60, bottom: Dimensions.vertical10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(title: "My Favorites", color: AppColors.titleColor, fontSize: Dimensions.font42, fontWeight: FontWeight.w600),
            SizedBox(
              width: width - 16,
              height: height * 0.7,
              child: ListView.builder(
                  itemCount: favoritesNotifier.fav.length,
                  padding: EdgeInsets.only(top: Dimensions.height20),
                  itemBuilder: (context, index){
                    final country = favoritesNotifier.fav[index];
                    return Padding(
                      padding: EdgeInsets.only(top: Dimensions.height5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Slidable(
                          key: const ValueKey(0),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                flex: 1,
                                onPressed: (context){
                                  setState(() {
                                    favoritesNotifier.favorites.removeWhere((element) => element == country["id"]);
                                    // delete(favoritesNotifier.favorites, "id");
                                    doNothing(country["key"]);
                                    cart.removeWhere((element) => element == country["id"]);
                                  });
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Container(
                                              height: 64,
                                              width: 64,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  const CircularProgressIndicator(),
                                                ],
                                              )
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  startTimer();
                                },
                                backgroundColor: AppColors.mainColor,
                                foregroundColor: Colors.white,
                                icon: Icons.heart_broken,
                                label: "Delete",
                              ),
                            ],
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.16,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      spreadRadius: 5,
                                      blurRadius: 0.3,
                                      offset: const Offset(0,1)
                                  )
                                ]
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Container(
                                        height: height * 0.15,
                                        width: width * 0.43,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
                                            image: DecorationImage(
                                                image: AssetImage(country['imageUrl']),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10, top: 10,),
                                      child: SizedBox(
                                        width: width * 0.35,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TitleText(title: country["address"] ?? '', color: AppColors.titleColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w600),
                                            const SizedBox(height: 5,),
                                            DefaultText(text: country["name"] ?? '', color: AppColors.titleColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w400),
                                            IconCategory(country: country,),
                                            SizedBox(height: width < 375 ? Dimensions.height10 : Dimensions.height5,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => incrementFunction(country),
                                                      child: Container(
                                                        width: 22,
                                                        height: 22,
                                                        alignment: Alignment.center,
                                                        decoration: BoxDecoration(
                                                          color: country['counter'] <= 1 ? Colors.grey.shade300 : AppColors.mainColor,
                                                          border: Border.all(
                                                            width: 2,
                                                            color: country['counter'] <= 1 ? Colors.grey : AppColors.mainColor,
                                                          ),
                                                          borderRadius: BorderRadius.circular(Dimensions.radius50),
                                                        ),
                                                        child: Icon(Icons.remove, size: 16, color: country['counter'] <= 1 ? AppColors.iconColor : AppColors.iconBackgroundColor),
                                                      ),
                                                    ),
                                                    SizedBox(width: Dimensions.width10,),
                                                    DefaultText(text: country['counter'].toString() ?? '', fontSize: Dimensions.font14, color: AppColors.titleColor, fontWeight: FontWeight.w500,),
                                                    SizedBox(width: Dimensions.width10,),
                                                    GestureDetector(
                                                      onTap: () => decrementFunction(country),
                                                      child: Container(
                                                        width: 22,
                                                        height: 22,
                                                        alignment: Alignment.center,
                                                        decoration: BoxDecoration(
                                                          color: AppColors.mainColor,
                                                          border: Border.all(
                                                            width: 2,
                                                            color: AppColors.mainColor,
                                                          ),
                                                          borderRadius: BorderRadius.circular(Dimensions.radius30),
                                                        ),
                                                        child: Icon(Icons.add, size: 16, color: AppColors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(width: Dimensions.width5,),
                                                DefaultText(text: "\$", color: AppColors.titleColor, fontSize: Dimensions.font20, fontWeight: FontWeight.w600),
                                                DefaultText(text: (int.parse(country["cost"]) * country['counter']).toString() ?? '', color: AppColors.titleColor, fontSize: Dimensions.font20, fontWeight: FontWeight.w600),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      )
    );
  }
}

class IconCategory extends StatelessWidget {
  final dynamic country;
  const IconCategory({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    IconData _getIconData(int index) {
      IconData iconData;
      if (country != null &&
          country["iconUrl"] != null &&
          index < country["iconUrl"].length) {
        switch (country["iconUrl"][index]) {
          case "beach_access":
            iconData = Icons.beach_access;
            break;
          case "location_city":
            iconData = Icons.location_city;
            break;
          case "sunny":
            iconData = Icons.sunny;
            break;
          case "travel_explore":
            iconData = Icons.travel_explore;
          default:
            iconData = Icons.error;
        }
      } else {
        iconData = Icons.error;
      }
      return iconData;
    }
    return Row(
      children: [
        Icon(
          _getIconData(0),
          color: AppColors.yellowIcon,
          size: Dimensions.iconSize24,
        ),
        SizedBox(width: Dimensions.width5),
        Icon(
          _getIconData(1),
          color: AppColors.mainColor,
          size: Dimensions.iconSize24,
        ),
        SizedBox(width: Dimensions.width5),
        Icon(
          _getIconData(2),
          color: AppColors.redColor,
          size: Dimensions.iconSize24,
        ),
      ],
    );
  }
}
