import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/bottom_nav/bottom_nav.dart';
import 'package:oasis/views/shared/hotel/hotel_card.dart';
import 'package:oasis/views/shared/my_search_bar.dart';
import 'package:oasis/views/shared/text/default_text.dart';

import '../../services/appcolors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  int selectedIndex  = 0;
  List<dynamic> hotelCards = [
    const HotelCard(assetImage: AssetImage("assets/image/home/hotel/Passalacqua_hotel 1.png"), title: "Passalacqua\n", text: 'Lake Como', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const HotelCard(assetImage: AssetImage("assets/image/home/hotel/hotel_Bangkok 1.png"), title: "Four Seasons \n", text: 'Bangkok', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const HotelCard(assetImage: AssetImage("assets/image/home/hotel/Tokyo_hotel 1.png"), title: "Aman Tokyo\n", text: 'Tokyo', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const HotelCard(assetImage: AssetImage("assets/image/home/hotel/Blanc_hotel 1.png"), title: "Cheval Blanc\n", text: 'Paris', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const HotelCard(assetImage: AssetImage("assets/image/home/hotel/HongKong_hotel 1.png"), title: "Rosewood H.K\n", text: 'Hong Kong', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
  ];
  final List<dynamic> text = [
    "All",
    "Popular",
    "Recomended",
    "Most Viewed",
    "Most Visited",
  ];
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double sliderHeight = height * 1.2;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left : Dimensions.horizontal24, top: Dimensions.vertical60, bottom: Dimensions.vertical10, right: Dimensions.horizontal24),
          child: Column(
            children: [
              MySearchBar(hintText: 'Discover a city', prefixOrSuffix: true, iconData: Icon(Icons.search), controller: searchController),
              SizedBox(height: Dimensions.height15,),
              Container(
                height: height * 0.035,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.hardEdge,
                  children: [
                    for (int i = 0; i < text.length; i++) // Assuming you have 5 items
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = i;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: Dimensions.width10),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height5),
                            decoration: BoxDecoration(
                              color: i == selectedIndex ? AppColors.mainColor : Colors.transparent,
                              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15)),
                            ),
                            child: DefaultText(
                              text: text[i],
                              color: i == selectedIndex ? Colors.white : AppColors.textColor,
                              fontSize: Dimensions.font14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                height: sliderHeight,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: hotelCards.length,
                    itemBuilder: (BuildContext context, int index){
                      return hotelCards[index];
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
