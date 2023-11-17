import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../models/recipe.dart';
import '../../../utils.dart';

class CarouselItem extends StatelessWidget {
  final Recipe recipe;
  const CarouselItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: 283.h,
          width: 312.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image: DecorationImage(
              image: NetworkImage(
                recipe.imageUrl!,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 283.h,
          width: 312.w,
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
                "${recipe.cookTime} mins",
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
              v(height: 85.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      recipe.recipeName!,
                      style: TextStyle(
                        color: white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  h(width: 5.w),
                  Image.asset(
                    "assets/images/non-veg-marker.png",
                    scale: 4,
                  )
                ],
              ),
              v(height: 12.h),
              Text(
                "Protein: ${recipe.protein}g",
                style: TextStyle(
                  color: white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              v(height: 4.h),
              Text(
                "Fat: ${recipe.fat}g",
                style: TextStyle(
                  color: white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              v(height: 4.h),
              // Text(
              //   "Carbohydrates: 20g",
              //   style: TextStyle(
              //     color: white,
              //     fontSize: 16.sp,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
              v(height: 12.h),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 24.75.h,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: backgroundBlue,
                        foregroundColor: white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        textStyle: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text("Show Recipe")),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
