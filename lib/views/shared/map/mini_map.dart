import 'package:flutter/material.dart';

import '../../../services/dimensions.dart';
import '../../ui/google_map.dart';

class MiniMap extends StatelessWidget {
  final List<AssetImage> images;
  final double latitude;
  final double longitude;
  final String subTitle;
  const MiniMap({super.key, required this.images, required this.latitude, required this.longitude, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => MyGoogleMap(latitude: latitude , longitude: longitude,assetImage: images, title: subTitle,),
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
        clipBehavior: Clip.hardEdge,
        width: width - 48,
        height: Dimensions.height20 * 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
            image: const DecorationImage(
                image: AssetImage('assets/image/home/hotel/map.png'),
                fit: BoxFit.cover
            )
        ),
      ),
    );
  }
}

