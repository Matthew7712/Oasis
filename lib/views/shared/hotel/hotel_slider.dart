import 'package:flutter/material.dart';
import 'package:oasis/views/shared/text/title_text.dart';
import '../../../services/appcolors.dart';
import '../../../services/dimensions.dart';

class HotelSlider extends StatefulWidget {
  final String title;
  final List list;
  const HotelSlider({super.key, required this.title, required this.list});

  @override
  State<HotelSlider> createState() => _HotelSliderState();
}

class _HotelSliderState extends State<HotelSlider> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.horizontal24, top: Dimensions.vertical10, right: 0, bottom: Dimensions.vertical10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(title: widget.title, color: AppColors.titleColor, fontSize: Dimensions.font32, fontWeight: FontWeight.w600),
          const SizedBox(height: 15,),
          SizedBox(
              height: height * 0.21,
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.list.length,
                    itemBuilder: (context, index){
                      return widget.list[index];
                    }
                ),
              )
          ),
        ],
      ),
    );
  }
}

