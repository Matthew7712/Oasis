import 'package:flutter/material.dart';
import 'package:oasis/views/shared/bottom_nav/bottom_nav.dart';
import 'package:oasis/views/ui/favourite_screen.dart';
import 'package:oasis/views/ui/profile_screen.dart';
import 'package:oasis/views/ui/search_screen.dart';
import 'package:provider/provider.dart';

import '../../controllers/bottom_provider.dart';
import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = [
    const HomeScreen(),
    const SearchScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {

    return Consumer<BottomNavigationBarNotifier>(
        builder: (context ,mainScreenPage,child) => Scaffold(
          backgroundColor: Colors.white,
          body: AnimatedSwitcher(
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            duration: Duration(milliseconds: 1000),
            child: pageList[mainScreenPage.currentIndex],
          ),
          bottomNavigationBar: const MyBottomNavigationBar(),
        )
    );
  }
}
