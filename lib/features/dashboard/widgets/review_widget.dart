import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({super.key});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  double rating = 0.0;
  final reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Tried it? Rate It!",
              style: TextStyle(
                color: white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            h(width: 10.w),
            RatingStars(
              value: rating,
              onValueChanged: (v) {
                setState(() {
                  rating = v;
                });
              },
              starBuilder: (index, color) => Icon(
                Icons.star,
                color: color,
              ),
              starCount: 5,
              starSize: 20,
              // valueLabelColor: white,
              // valueLabelTextStyle: TextStyle(
              //   color: white,
              //   fontWeight: FontWeight.w400,
              //   fontStyle: FontStyle.normal,
              //   fontSize: 16.sp,
              // ),
              // valueLabelRadius: 10,
              maxValue: 5,
              starSpacing: 2,
              // maxValueVisibility: true,
              // valueLabelVisibility: true,
              animationDuration: Duration(milliseconds: 1000),
              // valueLabelPadding:
              //     const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
              // valueLabelMargin: const EdgeInsets.only(right: 8),
              starOffColor: const Color(0xffe7e8ea),
              starColor: Colors.yellow,
            )
          ],
        ),
        v(height: 10.h),
        SizedBox(
          height: 40.h,
          child: TextField(
            controller: reviewController,
            // maxLines: 2,
            style: TextStyle(
              color: black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: "Write a review",
              filled: true,
              fillColor: white,
              hintStyle: TextStyle(
                color: hintGrey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: white,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: white,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: white,
                  width: 2,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
