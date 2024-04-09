import 'package:flutter/material.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/country/new_country_slider.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: const Column(
          children: [
            NewCountrySlider(assetImage: AssetImage('assets/image/country/country_card.png'),)
          ],
        ),
      ),
    );
  }
}
