import 'package:flutter/material.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/my_search_bar.dart';

import '../../models/country_model.dart';
import '../../services/appcolors.dart';
import '../../services/helper.dart';
import '../shared/country/country_screen.dart';
import '../shared/hotel/small_hotel_card.dart';
import '../shared/text/title_text.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with TickerProviderStateMixin{
  var searchController = TextEditingController();
  late final TabController _tabController;
  int selectedIndex  = 0;
  final List<dynamic> text = [
    "All",
    "Popular",
    "Recomended",
    "Most Viewed",
    "Most Visited",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left : Dimensions.horizontal24, top: Dimensions.height10, bottom: Dimensions.vertical10, right: Dimensions.horizontal24),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: height * 1.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySearchBar(hintText: 'Discover a city', prefixOrSuffix: true, iconData: Icon(Icons.search), controller: searchController),
                  TabBar(
                    splashBorderRadius: BorderRadius.all(Radius.circular(Dimensions.radius30)),
                    padding: EdgeInsets.only(top: Dimensions.vertical20, bottom: Dimensions.height10),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: AppColors.mainColor,
                    tabAlignment: TabAlignment.start,
                    labelStyle: TextStyle(
                      fontSize: Dimensions.font18,
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: "All",
                      ),
                      Tab(
                        text: "Popular",
                      ),
                      Tab(
                        text: "Recomended",
                      ),
                      Tab(
                        text: "Most Viewed",
                      ),
                      Tab(
                        text: "Most Visited",
                      )
                    ],
                  ),
                  Container(
                    height: height * 1.4,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        HotelFilter(tabIndex: 0,),
                        Popular(tabIndex: 1,),
                        Recommended(tabIndex: 2,),
                        MostViewed(tabIndex: 3,),
                        MostVisited(tabIndex: 4,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class HotelFilter extends StatefulWidget {
  int tabIndex;
  HotelFilter({super.key, this.tabIndex = 0});

  @override
  State<HotelFilter> createState() => _HotelFilterState();
}

class _HotelFilterState extends State<HotelFilter> {
  List<dynamic> hotelCards = [
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/Passalacqua_hotel 1.png"), title: "Passalacqua\n", text: 'Lake Como', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/hotel_Bangkok 1.png"), title: "Four Seasons \n", text: 'Bangkok', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/Tokyo_hotel 1.png"), title: "Aman Tokyo\n", text: 'Tokyo', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/Blanc_hotel 1.png"), title: "Cheval Blanc\n", text: 'Paris', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/HongKong_hotel 1.png"), title: "Rosewood H.K\n", text: 'Hong Kong', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height * 1.4,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: hotelCards.length,
            itemBuilder: (BuildContext context, int index){
              return hotelCards[index];
            }
        ),
      ),
    );
  }
}

class Popular extends StatefulWidget {
  int tabIndex;
  Popular({super.key, required this.tabIndex});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  List<dynamic> hotelCards = [
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/Passalacqua_hotel 1.png"), title: "Passalacqua\n", text: 'Lake Como', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/hotel_Bangkok 1.png"), title: "Four Seasons \n", text: 'Bangkok', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/Tailand.png"), title: "Tailand",
      images: [
        AssetImage('assets/image/country/japan/country_card.png'),
        AssetImage('assets/image/country/japan/JapanImage1.png'),
        AssetImage('assets/image/country/japan/JapanImage2.png'),
        AssetImage('assets/image/country/japan/JapanImage3.png'),
        AssetImage('assets/image/country/japan/JapanImage4.png'),
      ],
      subTitle: 'Bangkok\n',
      location: '',
      time: 'OPEN 09:00 AM',
      index: 5,
    ),
    SizedBox(width: Dimensions.width20,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/Vietnam.png"), title: "Vietnam",
      images: [
        AssetImage('assets/image/country/japan/country_card.png'),
        AssetImage('assets/image/country/japan/JapanImage1.png'),
        AssetImage('assets/image/country/japan/JapanImage2.png'),
        AssetImage('assets/image/country/japan/JapanImage3.png'),
        AssetImage('assets/image/country/japan/JapanImage4.png'),
      ],
      subTitle: 'Hanoi\n',
      location: '',
      time: 'OPEN 09:00 AM',
    ),
    SizedBox(width: Dimensions.width20,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/Turkey.png"), title: "Turkey",
      images: [
        AssetImage('assets/image/country/japan/country_card.png'),
        AssetImage('assets/image/country/japan/JapanImage1.png'),
        AssetImage('assets/image/country/japan/JapanImage2.png'),
        AssetImage('assets/image/country/japan/JapanImage3.png'),
        AssetImage('assets/image/country/japan/JapanImage4.png'),
      ],
      subTitle: 'Stambul\n',
      location: '',
      time: 'OPEN 09:00 AM',
      index: 7,
    ),
    SizedBox(width: Dimensions.width20,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/France.png"), title: "France", images: [
      AssetImage('assets/image/country/japan/country_card.png'),
      AssetImage('assets/image/country/japan/JapanImage1.png'),
      AssetImage('assets/image/country/japan/JapanImage2.png'),
      AssetImage('assets/image/country/japan/JapanImage3.png'),
      AssetImage('assets/image/country/japan/JapanImage4.png'),
    ],
      subTitle: 'Paris\n',
      location: '',
      time: 'OPEN 09:00 AM',
      index: 8,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height * 1.4,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: hotelCards.length,
            itemBuilder: (BuildContext context, int index){
              return hotelCards[index];
            }
        ),
      ),
    );
  }
}

class Recommended extends StatefulWidget {
  int tabIndex;
  Recommended({super.key, required this.tabIndex});

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  List<dynamic> hotelCards = [
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/Passalacqua_hotel 1.png"), title: "Passalacqua\n", text: 'Lake Como', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/hotel_Bangkok 1.png"), title: "Four Seasons \n", text: 'Bangkok', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/Amsterdam.png"), title: "Amsterdam",
      images: [
        AssetImage('assets/image/country/japan/country_card.png'),
        AssetImage('assets/image/country/japan/JapanImage1.png'),
        AssetImage('assets/image/country/japan/JapanImage2.png'),
        AssetImage('assets/image/country/japan/JapanImage3.png'),
        AssetImage('assets/image/country/japan/JapanImage4.png'),
      ],
      subTitle: 'Netherlands\n',
      location: '',
      time: 'OPEN 09:00 AM',
      index: 2,
    ),
    SizedBox(width: Dimensions.width15,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/Japan.png"), title: "Japan", subTitle: "Tokyo\n" ,
      images: [
        AssetImage('assets/image/country/japan/country_card.png'),
        AssetImage('assets/image/country/japan/JapanImage1.png'),
        AssetImage('assets/image/country/japan/JapanImage2.png'),
        AssetImage('assets/image/country/japan/JapanImage3.png'),
        AssetImage('assets/image/country/japan/JapanImage4.png'),
      ],
      location: 'Oyokogawa Water Park',
      time: 'OPEN 09:00 AM',
      latitude: 35.6572564,
      longitude: 139.7028246,
      index: 0,
    ),
    SizedBox(width: Dimensions.width15,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/South Africa.png"), title: "Rome",
      images: [
        AssetImage('assets/image/country/japan/country_card.png'),
        AssetImage('assets/image/country/japan/JapanImage1.png'),
        AssetImage('assets/image/country/japan/JapanImage2.png'),
        AssetImage('assets/image/country/japan/JapanImage3.png'),
        AssetImage('assets/image/country/japan/JapanImage4.png'),
      ],
      subTitle: 'Italy\n',
      location: '',
      time: 'OPEN 09:00 AM',
      index: 1,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height * 1.4,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: hotelCards.length,
            itemBuilder: (BuildContext context, int index){
              return hotelCards[index];
            }
        ),
      ),
    );
  }
}

class MostViewed extends StatefulWidget {
  int tabIndex;
  MostViewed({super.key, required this.tabIndex});

  @override
  State<MostViewed> createState() => _MostViewedState();
}

class _MostViewedState extends State<MostViewed> {
  List<dynamic> hotelCards = [
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/Passalacqua_hotel 1.png"), title: "Passalacqua\n", text: 'Lake Como', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/Tailand.png"), title: "Tailand",
      images: [
        AssetImage('assets/image/country/japan/country_card.png'),
        AssetImage('assets/image/country/japan/JapanImage1.png'),
        AssetImage('assets/image/country/japan/JapanImage2.png'),
        AssetImage('assets/image/country/japan/JapanImage3.png'),
        AssetImage('assets/image/country/japan/JapanImage4.png'),
      ],
      subTitle: 'Bangkok\n',
      location: '',
      time: 'OPEN 09:00 AM',
      index: 5,
    ),
    SizedBox(width: Dimensions.width20,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/Vietnam.png"), title: "Vietnam",
      images: [
        AssetImage('assets/image/country/japan/country_card.png'),
        AssetImage('assets/image/country/japan/JapanImage1.png'),
        AssetImage('assets/image/country/japan/JapanImage2.png'),
        AssetImage('assets/image/country/japan/JapanImage3.png'),
        AssetImage('assets/image/country/japan/JapanImage4.png'),
      ],
      subTitle: 'Hanoi\n',
      location: '',
      time: 'OPEN 09:00 AM',
    ),
    SizedBox(width: Dimensions.width20,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/Turkey.png"), title: "Turkey",
      images: [
        AssetImage('assets/image/country/japan/country_card.png'),
        AssetImage('assets/image/country/japan/JapanImage1.png'),
        AssetImage('assets/image/country/japan/JapanImage2.png'),
        AssetImage('assets/image/country/japan/JapanImage3.png'),
        AssetImage('assets/image/country/japan/JapanImage4.png'),
      ],
      subTitle: 'Stambul\n',
      location: '',
      time: 'OPEN 09:00 AM',
      index: 7,
    ),
    SizedBox(width: Dimensions.width20,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/France.png"), title: "France", images: [
      AssetImage('assets/image/country/japan/country_card.png'),
      AssetImage('assets/image/country/japan/JapanImage1.png'),
      AssetImage('assets/image/country/japan/JapanImage2.png'),
      AssetImage('assets/image/country/japan/JapanImage3.png'),
      AssetImage('assets/image/country/japan/JapanImage4.png'),
    ],
      subTitle: 'Paris\n',
      location: '',
      time: 'OPEN 09:00 AM',
      index: 8,
    ),
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/Blanc_hotel 1.png"), title: "Cheval Blanc\n", text: 'Paris', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/HongKong_hotel 1.png"), title: "Rosewood H.K\n", text: 'Hong Kong', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height * 1.4,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: hotelCards.length,
            itemBuilder: (BuildContext context, int index){
              return hotelCards[index];
            }
        ),
      ),
    );
  }
}

class MostVisited extends StatefulWidget {
  int tabIndex;
  MostVisited({super.key, required this.tabIndex});

  @override
  State<MostVisited> createState() => _MostVisitedState();
}

class _MostVisitedState extends State<MostVisited> {
  List<dynamic> hotelCards = [
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/Passalacqua_hotel 1.png"), title: "Passalacqua\n", text: 'Lake Como', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const SmallHotelCard(assetImage: AssetImage("assets/image/home/hotel/hotel_Bangkok 1.png"), title: "Four Seasons \n", text: 'Bangkok', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
      images: [
        AssetImage('assets/image/home/hotel/Frame 16.png'),
        AssetImage('assets/image/home/hotel/Frame 17.png'),
        AssetImage('assets/image/home/hotel/Frame 18.png'),
        AssetImage('assets/image/home/hotel/Frame 19.png'),
        AssetImage('assets/image/home/hotel/Frame 20.png'),
      ],
      location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
    SizedBox(height: Dimensions.height20,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/Amsterdam.png"), title: "Amsterdam",
      images: [
        AssetImage('assets/image/country/japan/country_card.png'),
        AssetImage('assets/image/country/japan/JapanImage1.png'),
        AssetImage('assets/image/country/japan/JapanImage2.png'),
        AssetImage('assets/image/country/japan/JapanImage3.png'),
        AssetImage('assets/image/country/japan/JapanImage4.png'),
      ],
      subTitle: 'Netherlands\n',
      location: '',
      time: 'OPEN 09:00 AM',
      index: 2,
    ),
    SizedBox(width: Dimensions.width15,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/Japan.png"), title: "Japan", subTitle: "Tokyo\n" ,
      images: [
        AssetImage('assets/image/country/japan/country_card.png'),
        AssetImage('assets/image/country/japan/JapanImage1.png'),
        AssetImage('assets/image/country/japan/JapanImage2.png'),
        AssetImage('assets/image/country/japan/JapanImage3.png'),
        AssetImage('assets/image/country/japan/JapanImage4.png'),
      ],
      location: 'Oyokogawa Water Park',
      time: 'OPEN 09:00 AM',
      latitude: 35.6572564,
      longitude: 139.7028246,
      index: 0,
    ),
    SizedBox(width: Dimensions.width15,),
    const CountryCard(assetImage: AssetImage("assets/image/home/card/South Africa.png"), title: "Rome",
      images: [
        AssetImage('assets/image/country/japan/country_card.png'),
        AssetImage('assets/image/country/japan/JapanImage1.png'),
        AssetImage('assets/image/country/japan/JapanImage2.png'),
        AssetImage('assets/image/country/japan/JapanImage3.png'),
        AssetImage('assets/image/country/japan/JapanImage4.png'),
      ],
      subTitle: 'Italy\n',
      location: '',
      time: 'OPEN 09:00 AM',
      index: 1,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height * 1.4,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: hotelCards.length,
            itemBuilder: (BuildContext context, int index){
              return hotelCards[index];
            }
        ),
      ),
    );
  }
}

class CountryCard extends StatefulWidget {
  final AssetImage assetImage;
  final String title;
  final String subTitle;
  final String location;
  final String time;
  final List<AssetImage> images;
  final double latitude;
  final double longitude;
  final int index;
  const CountryCard({super.key, required this.assetImage, required this.title, required this.subTitle , required this.images, required this.location, required this.time, this.longitude =0.0, this.latitude = 0.0, this.index = 0});

  @override
  State<CountryCard> createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> with TickerProviderStateMixin{
  late Future<List<Country>> _country;

  void getCountry() {
    _country = Helper().getCountryM();
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

    return Padding(
      padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: (){
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) => CountryScreen(
                  images: widget.images,
                  assetImage: widget.assetImage,
                  title: widget.subTitle,
                  subTitle: widget.title,
                  location: widget.location,
                  time: widget.time,
                  longitude: widget.longitude,
                  latitude: widget.latitude,
                  country: _country,
                  index: widget.index,
                ),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          },
          child: Container(
            width: width * 0.4,
            height: width < 375 ? height * 0.2 : height * 0.18,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
                image: DecorationImage(
                    image: widget.assetImage,
                    fit: BoxFit.cover
                )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontal14, vertical: Dimensions.vertical20),
              child: TitleText(title: widget.title, color: AppColors.white, fontSize: width < 325 ? Dimensions.font18 : width < 375 ? Dimensions.font20 : Dimensions.font24, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}





