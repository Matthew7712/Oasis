import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyRatingBar extends StatelessWidget {
  const MyRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    double initialRating = 0;
    double width = MediaQuery.of(context).size.width;
    return RatingBar.builder(
      initialRating: initialRating,
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
        initialRating = rating;
      },
    );
  }
}
