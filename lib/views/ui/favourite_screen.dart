import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:oasis/views/ui/main_screen.dart';
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()));
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
      };
    }).toList();
    cart = cartData.reversed.toList();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: favoritesNotifier.fav.length,
            padding: const EdgeInsets.only(top: 60),
            itemBuilder: (context, index){
              final country = favoritesNotifier.fav[index];
              return Padding(
                padding: const EdgeInsets.all(8),
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
                      height: MediaQuery.of(context).size.height * 0.13,
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
                                padding: const EdgeInsets.only(left: 20, top: 10,),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TitleText(title: country["address"] ?? '', color: AppColors.titleColor, fontSize: Dimensions.font16, fontWeight: FontWeight.w600),
                                    const SizedBox(height: 5,),
                                    DefaultText(text: country["name"] ?? '', color: AppColors.titleColor, fontSize: Dimensions.font14, fontWeight: FontWeight.w400),
                                    const SizedBox(height: 5,),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     AppStyle(text: '${country["price"]}', size: 18, fw: FontWeight.bold, color: Colors.black)
                                    //   ],
                                    // )
                                  ],
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
      )
    );
  }
}
