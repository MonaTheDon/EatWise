import 'package:eatwise/constants.dart';
import 'package:eatwise/features/dashboard/widgets/carousel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils.dart';

class MealPlanner extends StatelessWidget {
  const MealPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Nutrition Plan",
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w500,
                  color: white,
                ),
              ),
            ),
            v(height: 10.h),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Hungry? Let's see what we have for you!",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: white,
                ),
              ),
            ),
            v(height: 10.h),
            const Divider(
              color: white,
              thickness: 2,
            ),
            v(height: 12.h),
            CarouselWidget(),
          ],
        ),
      )),
    );
  }
}
