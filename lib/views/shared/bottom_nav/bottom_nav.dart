import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../ui/home/home_screen.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width > 425 ? 15 : 10, horizontal: width > 425 ? 15 :width > 375 ? 10 : 8),
      child: GNav(
        gap: 8,
        padding: const EdgeInsets.all(16),
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
    );
  }
}
