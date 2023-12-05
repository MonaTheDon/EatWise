// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';

import 'package:eatwise/models/recipe.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class SmartFridgeRecipeCard extends StatelessWidget {
  final Recipe recipe;
  const SmartFridgeRecipeCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(4, 4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 157.5.w,
            height: 105.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
              image: DecorationImage(
                image: NetworkImage(recipe.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          h(width: 8.w),
          SizedBox(
            width: 146.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 60.w,
                      child: Text(recipe.recipeName ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text("${recipe.cookTime ?? "0"} mins",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          )),
                    )
                  ],
                ),
                v(height: 12.h),
                Text(
                  "Protein: ${recipe.protein?.toStringAsFixed(2) ?? 0}g",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: grey,
                  ),
                ),
                Text(
                  "Fat: ${recipe.fat?.toStringAsFixed(2) ?? 0}g",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: grey,
                  ),
                ),
                Text(
                  "Carbs: ${recipe.carbohydrates?.toStringAsFixed(2) ?? 0}g",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
