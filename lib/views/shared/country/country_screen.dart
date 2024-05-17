import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oasis/services/dimensions.dart';
import 'package:oasis/views/shared/button/button.dart';
import 'package:oasis/views/shared/country/new_country_slider.dart';
import 'package:oasis/views/ui/main_screen.dart';
import 'package:provider/provider.dart';

import '../../../controllers/active_ticket_provider.dart';
import '../../../controllers/history_provider.dart';
import '../../../models/country_model.dart';
import '../../../services/appcolors.dart';
import '../map/mini_map.dart';
import '../text/title_text.dart';
import 'country_info.dart';

class CountryScreen extends StatefulWidget {
  final String title;
  final String subTitle;
  final String location;
  final String time;
  final AssetImage assetImage;
  final List<AssetImage> images;
  final double latitude;
  final double longitude;
  final Future<List<Country>> _country;
  final int index;
  CountryScreen({super.key, required this.subTitle ,required this.title ,required this.assetImage ,required this.images, required this.location, required this.time, this.longitude =0.0, this.latitude = 0.0, required Future<List<Country>> country, required this.index}) : _country = country;

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var historyNotifier = Provider.of<HistoryNotifier>(context);
    historyNotifier.getAllData();
    var ticketNotifier = Provider.of<TicketNotifier>(context);
    ticketNotifier.getAllData();
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Country>>(
        future: widget._country,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          } else if(snapshot.hasError){
            return const Text("Error");
          } else{
            final country = snapshot.data;
            return ListView.builder(
                itemCount: country!.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final country = snapshot.data![widget.index];
                  return Container(
                      width: width,
                      height: width < 325 ? height * 0.75 : width < 360
                          ? height * 0.65
                          : height * 0.55,
                      child: Scaffold(
                        body: SingleChildScrollView(
                          child: Column(
                            children: [
                              NewCountrySlider(id: country.id),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.vertical10,
                                    horizontal: Dimensions.horizontal24),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        RichText(text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: country.name,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .w600,
                                                      fontSize: width < 325
                                                          ? Dimensions.font24
                                                          : width < 375
                                                          ? Dimensions.font28
                                                          : Dimensions.font32,
                                                      fontFamily: "Montserrat",
                                                      color: AppColors
                                                          .titleColor
                                                  )
                                              ),
                                              TextSpan(
                                                  text: country.address,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .w500,
                                                      fontSize: width < 325
                                                          ? Dimensions.font12
                                                          : width < 375
                                                          ? Dimensions.font14
                                                          : Dimensions.font16,
                                                      fontFamily: "Lato",
                                                      color: AppColors
                                                          .titleColor
                                                  )
                                              )
                                            ]
                                        )),
                                        TitleText(title: "\$" + country.cost,
                                            color: AppColors.titleColor,
                                            fontSize: width < 325 ? Dimensions
                                                .font24 : width < 375
                                                ? Dimensions.font28
                                                : Dimensions.font32,
                                            fontWeight: FontWeight.w700)
                                      ],
                                    ),
                                    SizedBox(height: Dimensions.height20,),
                                    CountryInfo(iconData: Icons.map_outlined,
                                        text: widget.location),
                                    SizedBox(height: Dimensions.height20,),
                                    CountryInfo(
                                        iconData: Icons.watch_later_outlined,
                                        text: widget.time),
                                    SizedBox(height: Dimensions.height20,),
                                    MiniMap(latitude: widget.latitude,
                                      longitude: widget.longitude,
                                      subTitle: widget.subTitle,
                                      images: widget.images,),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        bottomNavigationBar: Container(
                            width: width - 48,
                            padding: EdgeInsets.symmetric(horizontal: Dimensions
                                .horizontal24, vertical: Dimensions.vertical20),
                            child: Button(text: "Book now", event: () {
                              historyNotifier.createHistoryBox({
                                "id" : country.id,
                                "name" : country.name,
                                "address" : country.address,
                                "region" : country.region,
                                "description" : country.description,
                                "imageUrl" : country.imageUrl[0],
                                "dateTime": country.dateTime,
                                "cost" : country.cost,
                              });
                              ticketNotifier.createTicketBox({
                                "id" : country.id,
                                "name" : country.name,
                                "address" : country.address,
                                "region" : country.region,
                                "description" : country.description,
                                "imageUrl" : country.imageUrl[0],
                                "dateTime": country.dateTime,
                                "cost": country.cost,
                              });
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: const Duration(milliseconds: 500),
                                  pageBuilder: (_, __, ___) => const MainScreen(),
                                  transitionsBuilder: (_, animation, __, child) {
                                    return FadeTransition(opacity: animation, child: child,);
                                  },
                                ),
                              );
                            })
                        ),
                      )
                  );
                }
            );
          }
        },
      ),
    );
  }
}