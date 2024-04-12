import 'package:flutter/material.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/country/country_screen.dart';
import 'package:oasis/views/shared/text/title_text.dart';

import '../../../services/appcolors.dart';

class CountryCard extends StatelessWidget {
  final AssetImage assetImage;
  final String title;
  final String subTitle;
  final String location;
  final String time;
  final List<AssetImage> images;
  final double latitude;
  final double longitude;
  const CountryCard({super.key, required this.assetImage, required this.title, required this.subTitle , required this.images, required this.location, required this.time, this.longitude =0.0, this.latitude = 0.0});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => CountryScreen(
              images: images,
              assetImage: assetImage,
              title: subTitle,
              subTitle: title,
              location: location,
              time: time,
              longitude: longitude,
              latitude: latitude,
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
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
          image: DecorationImage(
            image: assetImage,
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontal14, vertical: Dimensions.vertical20),
          child: TitleText(title: title, color: AppColors.white, fontSize: width < 325 ? Dimensions.font18 : width < 375 ? Dimensions.font20 : Dimensions.font24, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
