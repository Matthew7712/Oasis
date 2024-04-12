import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/button/button.dart';
import 'package:oasis/views/shared/country/country_info.dart';
import 'package:oasis/views/shared/country/new_country_slider.dart';
import 'package:oasis/views/shared/map/mini_map.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import 'package:oasis/views/ui/google_map.dart';

import '../../../services/appcolors.dart';

class CountryScreen extends StatefulWidget {
  final String title;
  final String subTitle;
  final String location;
  final String time;
  final AssetImage assetImage;
  final List<AssetImage> images;
  final double latitude;
  final double longitude;
  const CountryScreen({super.key, required this.subTitle ,required this.title ,required this.assetImage ,required this.images, required this.location, required this.time, this.longitude =0.0, this.latitude = 0.0});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            NewCountrySlider(assetImage: widget.assetImage, images: widget.images,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontal24, vertical: Dimensions.vertical10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(
                                text: widget.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width < 325 ? Dimensions.font24 : width < 375 ? Dimensions.font28 : Dimensions.font32,
                                    fontFamily: "Montserrat",
                                    color: AppColors.titleColor
                                )
                            ),
                            TextSpan(
                                text: widget.subTitle,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: width < 325 ? Dimensions.font16 : width < 375 ? Dimensions.font18 : Dimensions.font20,
                                    fontFamily: "Lato",
                                    color: AppColors.titleColor
                                )
                            )
                          ]
                      )),
                      TitleText(title: "\$500", color: AppColors.titleColor, fontSize: width < 325 ? Dimensions.font24 : width < 375 ? Dimensions.font28 : Dimensions.font32, fontWeight: FontWeight.w700)
                    ],
                  ),
                  SizedBox(height: Dimensions.height20,),
                  CountryInfo(iconData: Icons.map_outlined, text: widget.location),
                  SizedBox(height: Dimensions.height20,),
                  CountryInfo(iconData: Icons.watch_later_outlined, text: widget.time),
                  SizedBox(height: Dimensions.height20,),
                  MiniMap(latitude: widget.latitude, longitude: widget.longitude, subTitle: widget.subTitle, images: widget.images,),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          width: width - 48,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontal24, vertical: Dimensions.vertical20),
          child: Button(text: "Book now", event: (){

          })
      ),
    );
  }
}

