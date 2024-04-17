import 'package:flutter/material.dart';
import 'package:oasis/views/shared/bottom_nav/bottom_nav.dart';
import 'package:oasis/views/shared/country/country_slider.dart';
import 'package:oasis/views/ui/home/home_slider.dart';
import '../../../services/dimensions.dart';
import '../../shared/country/country_card.dart';
import '../../shared/hotel/hotel_card.dart';
import '../../shared/hotel/hotel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> item1 = [
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
      ),
      SizedBox(width: Dimensions.width15,),
      const CountryCard(assetImage: AssetImage("assets/image/home/card/Amsterdam.png"), title: "Amsterdam",
        images: [
          AssetImage('assets/image/country/japan/country_card.png'),
          AssetImage('assets/image/country/japan/JapanImage1.png'),
          AssetImage('assets/image/country/japan/JapanImage2.png'),
          AssetImage('assets/image/country/japan/JapanImage3.png'),
          AssetImage('assets/image/country/japan/JapanImage4.png'),
        ],
        subTitle: 'Netherlands',
        location: '',
        time: 'OPEN 09:00 AM',
      ),
      SizedBox(width: Dimensions.width15,),
      const CountryCard(assetImage: AssetImage("assets/image/home/card/South Africa.png"), title: "South Africa",
        images: [
          AssetImage('assets/image/country/japan/country_card.png'),
          AssetImage('assets/image/country/japan/JapanImage1.png'),
          AssetImage('assets/image/country/japan/JapanImage2.png'),
          AssetImage('assets/image/country/japan/JapanImage3.png'),
          AssetImage('assets/image/country/japan/JapanImage4.png'),
        ],
        subTitle: 'Egypt',
        location: '',
        time: 'OPEN 09:00 AM',
      ),
      SizedBox(width: Dimensions.width15,),
      const CountryCard(assetImage: AssetImage("assets/image/home/card/Poland.png"), title: "Poland",
        images: [
          AssetImage('assets/image/country/japan/country_card.png'),
          AssetImage('assets/image/country/japan/JapanImage1.png'),
          AssetImage('assets/image/country/japan/JapanImage2.png'),
          AssetImage('assets/image/country/japan/JapanImage3.png'),
          AssetImage('assets/image/country/japan/JapanImage4.png'),
        ],
        subTitle: 'Varshava',
        location: '',
        time: 'OPEN 09:00 AM',
      ),
    ];
    List<dynamic> item2 = [
      const CountryCard(assetImage: AssetImage("assets/image/home/card/Tailand.png"), title: "Tailand",
        images: [
          AssetImage('assets/image/country/japan/country_card.png'),
          AssetImage('assets/image/country/japan/JapanImage1.png'),
          AssetImage('assets/image/country/japan/JapanImage2.png'),
          AssetImage('assets/image/country/japan/JapanImage3.png'),
          AssetImage('assets/image/country/japan/JapanImage4.png'),
        ],
        subTitle: 'Bangkok',
        location: '',
        time: 'OPEN 09:00 AM',
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
        subTitle: 'Hanoi',
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
        subTitle: 'Stambul',
        location: '',
        time: 'OPEN 09:00 AM',
      ),
      SizedBox(width: Dimensions.width20,),
      const CountryCard(assetImage: AssetImage("assets/image/home/card/France.png"), title: "France", images: [
          AssetImage('assets/image/country/japan/country_card.png'),
          AssetImage('assets/image/country/japan/JapanImage1.png'),
          AssetImage('assets/image/country/japan/JapanImage2.png'),
          AssetImage('assets/image/country/japan/JapanImage3.png'),
          AssetImage('assets/image/country/japan/JapanImage4.png'),
        ],
        subTitle: 'Paris',
        location: '',
        time: 'OPEN 09:00 AM',
      ),
      SizedBox(width: Dimensions.width20,),
      const CountryCard(assetImage: AssetImage("assets/image/home/card/Greece.png"), title: "Greece",
        images: [
          AssetImage('assets/image/country/japan/country_card.png'),
          AssetImage('assets/image/country/japan/JapanImage1.png'),
          AssetImage('assets/image/country/japan/JapanImage2.png'),
          AssetImage('assets/image/country/japan/JapanImage3.png'),
          AssetImage('assets/image/country/japan/JapanImage4.png'),
        ],
        subTitle: 'Italy',
        location: '',
        time: 'OPEN 09:00 AM',
      ),
    ];
    List<dynamic> item3 = [
      const HotelCard(assetImage: AssetImage("assets/image/home/hotel/Passalacqua_hotel 1.png"), title: "Passalacqua\n", text: 'Lake Como', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
        images: [
          AssetImage('assets/image/home/hotel/Frame 16.png'),
          AssetImage('assets/image/home/hotel/Frame 17.png'),
          AssetImage('assets/image/home/hotel/Frame 18.png'),
          AssetImage('assets/image/home/hotel/Frame 19.png'),
          AssetImage('assets/image/home/hotel/Frame 20.png'),
        ],
        location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
      SizedBox(width: Dimensions.width20,),
      const HotelCard(assetImage: AssetImage("assets/image/home/hotel/hotel_Bangkok 1.png"), title: "Four Seasons \n", text: 'Bangkok', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
        images: [
          AssetImage('assets/image/home/hotel/Frame 16.png'),
          AssetImage('assets/image/home/hotel/Frame 17.png'),
          AssetImage('assets/image/home/hotel/Frame 18.png'),
          AssetImage('assets/image/home/hotel/Frame 19.png'),
          AssetImage('assets/image/home/hotel/Frame 20.png'),
        ],
        location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
      SizedBox(width: Dimensions.width20,),
      const HotelCard(assetImage: AssetImage("assets/image/home/hotel/Tokyo_hotel 1.png"), title: "Aman Tokyo\n", text: 'Tokyo', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
        images: [
          AssetImage('assets/image/home/hotel/Frame 16.png'),
          AssetImage('assets/image/home/hotel/Frame 17.png'),
          AssetImage('assets/image/home/hotel/Frame 18.png'),
          AssetImage('assets/image/home/hotel/Frame 19.png'),
          AssetImage('assets/image/home/hotel/Frame 20.png'),
        ],
        location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
      SizedBox(width: Dimensions.width20,),
      const HotelCard(assetImage: AssetImage("assets/image/home/hotel/Blanc_hotel 1.png"), title: "Cheval Blanc\n", text: 'Paris', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',
        images: [
          AssetImage('assets/image/home/hotel/Frame 16.png'),
          AssetImage('assets/image/home/hotel/Frame 17.png'),
          AssetImage('assets/image/home/hotel/Frame 18.png'),
          AssetImage('assets/image/home/hotel/Frame 19.png'),
          AssetImage('assets/image/home/hotel/Frame 20.png'),
        ],
        location: 'Via Besana, 59', time: 'OPEN 09:00 AM',),
      SizedBox(width: Dimensions.width20,),
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
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const HomeSlider(),
            SizedBox(height: Dimensions.height20,),
            CountrySlider(title: "Popular Destination", list: item1,),
            CountrySlider(title: "Best Deals", list: item2,),
            HotelSlider(title: "Best hotels", list: item3,),
          ],
        ),
      ),
    );
  }
}
