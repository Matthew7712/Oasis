import 'package:flutter/material.dart';
import 'package:oasis/views/shared/rating/rating_bar.dart';
import 'package:oasis/views/shared/text/default_text.dart';
import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';
import 'hotel_screen.dart';

class HotelCard extends StatelessWidget {
  final AssetImage assetImage;
  final String title;
  final String text;
  final String description;
  final String location;
  final String time;
  final List<AssetImage> images;

  const HotelCard({super.key, required this.assetImage, required this.title, required this.text, required this.description , required this.images, required this.location, required this.time});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => HotelScreen(
              images: images,
              assetImage: assetImage,
              title: title,
              subTitle: description,
              location: location,
              time: time,
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
        width: width - 48,
        height: width < 375 ? height * 0.24 : height * 0.21,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius20),
          border: Border.all(width: 1, color: Colors.black),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width * 0.4,
              height: width < 375 ? height * 0.26 : height * 0.21,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20), bottomLeft: Radius.circular(Dimensions.radius20)),
                  image: DecorationImage(
                      image: assetImage,
                    fit: BoxFit.cover
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.horizontal30 / 2, vertical: width < 325 ? 5 :  Dimensions.vertical30 / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(text: title, style: TextStyle(color: AppColors.titleColor, fontSize: width < 325 ? Dimensions.font14 : width < 375 ? Dimensions.font16 : Dimensions.font18, fontFamily: "Montserrat", fontWeight: FontWeight.w600)),
                      TextSpan(text: text, style: TextStyle(color: AppColors.titleColor, fontSize: width < 375 ? Dimensions.font12 :Dimensions.font14, fontFamily: "Lato", fontWeight: FontWeight.w500))
                    ]
                  )),
                  const SizedBox(height: 5,),
                  DefaultText(text: description, color: AppColors.titleColor, fontSize: width < 375 ? Dimensions.font10 :Dimensions.font12, fontWeight: FontWeight.w400),
                  SizedBox(height: (width < 325 ? Dimensions.height10 : width < 375 ? Dimensions.height15 : Dimensions.height20),),
                  const MyRatingBar()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
