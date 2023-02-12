import 'package:bebop/core/utils/media_query_values.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/constants.dart';

class CustomCarousalSlider extends StatefulWidget {
  const CustomCarousalSlider({Key? key}) : super(key: key);

  @override
  State<CustomCarousalSlider> createState() => _CustomCarousalSliderState();
}

class _CustomCarousalSliderState extends State<CustomCarousalSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: Constants().images.length,
      itemBuilder: (context, index, pageViewIndex) {
        return Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 2.5.w),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15.0.sp),
              image: DecorationImage(
                image: AssetImage(Constants().images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  bottom: 2.h, end: 2.0.w, start: 2.0.w),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Text(
                  Constants().imageTitle[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0.sp,
                    shadows: [
                      Shadow(
                        color: AppColors.spaceCadet,
                        offset: const Offset(1.0, 0.0),
                        blurRadius: 1.5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: context.height * 0.2,
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
    );
  }
}
