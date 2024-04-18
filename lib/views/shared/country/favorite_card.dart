import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import 'package:oasis/views/ui/favourite_screen.dart';
import 'package:provider/provider.dart';

import '../../../controllers/favorite_provider.dart';
import '../../../services/appcolors.dart';

class FavoriteCard extends StatefulWidget {
  final String name;
  final String address;
  final String region;
  final String id;
  final String image;

  const FavoriteCard({
    Key? key,
    required this.name,
    required this.address,
    required this.region,
    required this.id,
    required this.image,
  }) : super(key: key);

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  final _favBox = Hive.box('fav_box');
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    var favoritesNotifier = Provider.of<FavoriteNotifier>(context, listen: true);
    favoritesNotifier.getFavorities();

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(246, 246, 246, 1),
                spreadRadius: 1,
                blurRadius: 0.6,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.23,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                          onTap: () async {
                            if(favoritesNotifier.ids.contains(widget.id)){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteScreen()));
                            } else{
                              favoritesNotifier.createFavBox(
                                  {
                                    "id" : widget.id,
                                    "name" : widget.name,
                                    "category" : widget.address,
                                    "price" : widget.region,
                                    "imageUrl" : widget.image
                                  }
                              );
                              setState(() {

                              });
                            }
                          },
                          child: favoritesNotifier.ids.contains(widget.id) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline)
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SizedBox(
                        height:110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            TitleText(
                              title: widget.name,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            DefaultText(
                              text: widget.address,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                            Expanded(child: Container())
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TitleText(
                            title: widget.region,
                            fontSize: Dimensions.font28,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              DefaultText(
                                text: "Colors",
                                fontSize: Dimensions.font18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainColor,
                              ),
                              const SizedBox(width: 5),
                              GestureDetector(
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}