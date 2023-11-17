import 'package:eatwise/constants.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: 189.h,
          width: 358.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: DecorationImage(
              image: NetworkImage(
                  "https://fastly.picsum.photos/id/398/200/300.jpg?hmac=Hfi27DwRf-atKwN-O57cBXGhlUtMCe6rozr2rWH8xH8"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 189.h,
          width: 358.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: black.withOpacity(0.5),
          ),
        ),
        Positioned(
          top: 15,
          right: 25,
          child: Row(
            children: [
              Icon(MdiIcons.clockOutline, color: white, size: 20.sp),
              h(width: 5.w),
              Text(
                "25 mins",
                style: TextStyle(
                  color: white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biryani",
                    style: TextStyle(
                      color: white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  h(width: 5.w),
                  Image.asset(
                    "assets/images/non-veg-marker.png",
                    scale: 4,
                  )
                ],
              ),
            ]
          ),
      
        ),
      ]
    );
  }
}