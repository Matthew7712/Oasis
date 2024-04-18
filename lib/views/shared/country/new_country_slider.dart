import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oasis/models/country_model.dart';
import 'package:oasis/views/ui/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../controllers/favorite_provider.dart';
import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../../services/helper.dart';

class NewCountrySlider extends StatefulWidget {
  final String id;
  const NewCountrySlider({super.key, required this.id});

  @override
  State<NewCountrySlider> createState() => _NewCountrySliderState();
}

class _NewCountrySliderState extends State<NewCountrySlider> with TickerProviderStateMixin{
  int selectedIndex = 0;
  late Future<Country> country;
  final _favBox = Hive.box('fav_box');
  bool isFavorite = false;
  void doNothing(int key) async{
    await _favBox.delete(key);
  }
  void getCountry(){
    country = Helper().getCountryById(widget.id);
  }

  @override
  void initState() {
    super.initState();
    getCountry();
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
    return FutureBuilder<Country>(
        future: country,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text("Error");
          } else {
            final countries = snapshot.data;
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(child: child, opacity: animation);
              },
              child: Container(
                key: ValueKey<String>(countries!.imageUrl[selectedIndex]),
                width: width,
                height: width < 325 ? height * 0.75 : width < 360 ? height * 0.65 : height * 0.55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20), topRight: Radius.circular(Dimensions.radius20)),
                  image: DecorationImage(
                      image: AssetImage(countries!.imageUrl[selectedIndex]),
                      fit: BoxFit.cover
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: Dimensions.horizontal24, top: Dimensions.vertical60, right: Dimensions.horizontal24, bottom: Dimensions.height30),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      clipBehavior: Clip.hardEdge,
                                      child: Icon(Icons.arrow_back, size: Dimensions.iconSize24, color: AppColors.iconColor,),
                                    ),
                                  )
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20))
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.save_alt_outlined, size: Dimensions.iconSize24, color: AppColors.iconColor,),
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(width: Dimensions.width10,),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Consumer<FavoriteNotifier>(
                                    builder: (context, favoritesNotifier, child){
                                      isFavorite = favoritesNotifier.favorites.any((fav) => fav['id'] == widget.id);
                                      return InkWell(
                                        onTap: () {
                                          if (isFavorite == true) {
                                            setState(() {
                                              isFavorite = false;
                                              int index = favoritesNotifier.favorites.indexWhere((fav) => fav['id'] == widget.id);
                                              if (index != -1) {
                                                favoritesNotifier.favorites.removeAt(index);
                                                doNothing(favoritesNotifier.fav[index]["key"]);
                                                cart.removeWhere((element) => element == favoritesNotifier.fav[index]["id"]);
                                              }
                                              Navigator.push((context), PageRouteBuilder(
                                                transitionDuration: const Duration(milliseconds: 500),
                                                pageBuilder: (_, __, ___) => const MainScreen(),
                                                transitionsBuilder: (_, animation, __, child) {
                                                  return FadeTransition(
                                                    opacity: animation,
                                                    child: child,
                                                  );
                                                },
                                              ),);
                                            });
                                          } else {
                                            setState(() {
                                              favoritesNotifier.createFavBox({
                                                "id" : countries.id,
                                                "name" : countries.name,
                                                "address" : countries.address,
                                                "region" : countries.region,
                                                "imageUrl" : countries.imageUrl[0],
                                              });
                                              isFavorite = true;
                                              print(isFavorite);
                                            });
                                          }
                                          setState(() {
              
                                          });
                                        },
                                          child :isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline)
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: width - 48,
                          height: width < 325 ? height * 0.1 : height * 0.08,
                          decoration: BoxDecoration(
                              color: AppColors.blurColor,
                              borderRadius: BorderRadius.circular(Dimensions.radius15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < countries.imageUrl.length; i++)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = i;
                                      });
                                    },
                                    child: Container(
                                      width: width * 0.13,
                                      height: width * 0.13,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15)),
                                          image: DecorationImage(
                                              image: AssetImage(countries.imageUrl[i]),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}

