import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyRatingBar extends StatelessWidget {
  final double rating;
  const MyRatingBar({super.key, this.rating = 0});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: width < 375 ? 16 : 24,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      unratedColor: Colors.grey.shade300,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        rating = rating;
      },
    );
  }
}
