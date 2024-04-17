import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:oasis/views/ui/favourite_screen.dart';
import 'package:oasis/views/ui/profile_screen.dart';
import 'package:oasis/views/ui/search_screen.dart';
import 'package:provider/provider.dart';

import '../../../controllers/bottom_provider.dart';
import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import '../../ui/home/home_screen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final navIndexProvider = Provider.of<BottomNavigationBarNotifier>(context);

    return Consumer<BottomNavigationBarNotifier>(
        builder: (context,bottomNavigationBarNotifier, child){
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
                setState(() {
                  navIndexProvider.setIndex(index);
                });
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
    );
  }
}

