import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:oasis/views/shared/country/country_slider.dart';
import 'package:oasis/views/ui/home/home_slider.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../shared/country/country_card.dart';
import '../../shared/hotel/hotel_card.dart';
import '../../shared/hotel/hotel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> item1 = [
      const CountryCard(assetImage: AssetImage("assets/image/home/card/Japan.png"), title: "Japan"),
      SizedBox(width: Dimensions.width15,),
      const CountryCard(assetImage: AssetImage("assets/image/home/card/Amsterdam.png"), title: "Amsterdam"),
      SizedBox(width: Dimensions.width15,),
      const CountryCard(assetImage: AssetImage("assets/image/home/card/South Africa.png"), title: "South Africa"),
      SizedBox(width: Dimensions.width15,),
      const CountryCard(assetImage: AssetImage("assets/image/home/card/Poland.png"), title: "Poland"),
    ];
    List<dynamic> item2 = [
      const CountryCard(assetImage: AssetImage("assets/image/home/card/Tailand.png"), title: "Tailand"),
      SizedBox(width: Dimensions.width20,),
      const CountryCard(assetImage: AssetImage("assets/image/home/card/Vietnam.png"), title: "Vietnam"),
      SizedBox(width: Dimensions.width20,),
      const CountryCard(assetImage: AssetImage("assets/image/home/card/Turkey.png"), title: "Turkey"),
      SizedBox(width: Dimensions.width20,),
      const CountryCard(assetImage: AssetImage("assets/image/home/card/France.png"), title: "France"),
      SizedBox(width: Dimensions.width20,),
      const CountryCard(assetImage: AssetImage("assets/image/home/card/Greece.png"), title: "Greece"),
    ];
    List<dynamic> item3 = [
      const HotelCard(assetImage: AssetImage("assets/image/home/hotel/Passalacqua_hotel 1.png"), title: "Passalacqua\n", text: 'Lake Como', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',),
      SizedBox(width: Dimensions.width20,),
      const HotelCard(assetImage: AssetImage("assets/image/home/hotel/hotel_Bangkok 1.png"), title: "Four Seasons \n", text: 'Bangkok', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',),
      SizedBox(width: Dimensions.width20,),
      const HotelCard(assetImage: AssetImage("assets/image/home/hotel/Tokyo_hotel 1.png"), title: "Aman Tokyo\n", text: 'Tokyo', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',),
      SizedBox(width: Dimensions.width20,),
      const HotelCard(assetImage: AssetImage("assets/image/home/hotel/Blanc_hotel 1.png"), title: "Cheval Blanc\n", text: 'Paris', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',),
      SizedBox(width: Dimensions.width20,),
      const HotelCard(assetImage: AssetImage("assets/image/home/hotel/HongKong_hotel 1.png"), title: "Rosewood H.K\n", text: 'Hong Kong', description: 'Its location, on the shore of \nLake Como.The history \nof the villa, with stories that \ndate as far back as 1787.',),
    ];
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const HomeSlider(),
            const SizedBox(height: 20,),
            CountrySlider(title: "Popular Destination", list: item1,),
            CountrySlider(title: "Best Deals", list: item2,),
            HotelSlider(title: "Best hotels", list: item3,),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: width > 425 ? 15 : 10, horizontal: width > 425 ? 15 :width > 375 ? 10 : 8),
        child: GNav(
          gap: 8,
          color: AppColors.inactiveNavigateItemColor,
          activeColor: AppColors.activeNavigateItemColor,
          tabBorderRadius: Dimensions.radius50,
          tabBackgroundColor: Colors.teal.shade100.withOpacity(0.8),
          onTabChange: (index){
            if (index == 0) {
              Navigator.push(
                  context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (_, __, ___) => const HomeScreen(),
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            } else if (index == 1) {
              // Get.toNamed('/search');
            } else if (index == 2) {
              // Get.toNamed('/favorite');
            } else if (index == 3) {
              // Get.toNamed('/profile');
            }
          },
          // tabActiveBorder: Border.all(width: 1, color: Colors.black, style: BorderStyle.solid),
          tabs: const [
            GButton(icon: Icons.home_outlined, text: "Home", textStyle: TextStyle(fontWeight: FontWeight.w600, color: AppColors.activeNavigateItemColor),),
            GButton(icon: Icons.search_outlined, text: "Search", textStyle: TextStyle(fontWeight: FontWeight.w600, color: AppColors.activeNavigateItemColor),),
            GButton(icon: Icons.favorite_outline, text: "Favorite", textStyle: TextStyle(fontWeight: FontWeight.w600, color: AppColors.activeNavigateItemColor),),
            GButton(icon: Icons.person_outline, text: "Profile", textStyle: TextStyle(fontWeight: FontWeight.w600, color: AppColors.activeNavigateItemColor),)
          ],
        ),
      )
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   backgroundColor: Colors.white,
      //   selectedItemColor: AppColors.activeNavigateItemColor,
      //   selectedFontSize: Dimensions.font14,
      //   unselectedFontSize: Dimensions.font14,
      //   unselectedItemColor: AppColors.inactiveNavigateItemColor,
      //   unselectedLabelStyle: TextStyle(color: AppColors.inactiveNavigateItemColor),
      //   iconSize: Dimensions.iconSize24,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: "Search"),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: "Favorite"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile")
      //   ],
      // ),
    );
  }
}
