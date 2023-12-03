import 'package:eatwise/constants.dart';
import 'package:eatwise/models/recipe.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    // return Stack(
    //   alignment: Alignment.bottomLeft,
    //   children: [
    //     Container(
    //       height: 189.h,
    //       width: 358.w,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(20.r),
    //         image: DecorationImage(
    //           image: NetworkImage(
    //               recipe.imageUrl!),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     ),
    //     Container(
    //       height: 189.h,
    //       width: 358.w,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(8.r),
    //         color: black.withOpacity(0.5),
    //       ),
    //     ),
    //     Positioned(
    //       top: 15,
    //       right: 25,
    //       child: Row(
    //         children: [
    //           Icon(MdiIcons.clockOutline, color: white, size: 20.sp),
    //           h(width: 5.w),
    //           Text(
    //             "${recipe.cookTime} mins",
    //             style: TextStyle(
    //               color: white,
    //               fontSize: 16.sp,
    //               fontWeight: FontWeight.w400,
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             children: [
    //               SizedBox(
    //                 width: 200.w,
    //                 child: Text(
    //                   recipe.recipeName!,
    //                   maxLines: 3,
    //                   overflow: TextOverflow.ellipsis,
    //                   style: TextStyle(
    //                     color: white,
    //                     fontSize: 18.sp,
    //                     fontWeight: FontWeight.w600,
    //                   ),
    //                 ),
    //               ),
    //               // h(width: 5.w),
    //               v(height: 30.w),

    //           Image.asset(
    //                 "assets/images/non-veg-marker.png",
    //                 scale: 4,
    //               )
    //             ],
    //           ),
    //           h(width: 5.w),
    //         ]
    //       ),

    //     ),
    //   ]
    // );
    return Container(
      height: 180.h,
      width: 150.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(4, 4),
            ),
          ],
          color: white),
      child: Column(
        children: [
          Container(
            height: 100.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(recipe.imageUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 4.w, right: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            recipe.recipeName!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        // h(width: 2.w),
                        // recipe.isVegan ?? true
                        //     ? SizedBox(
                        //         child: Image.asset(
                        //           "assets/images/veg-marker.png",
                        //           scale: 4,
                        //         ),
                        //       )
                        //     : SizedBox(
                        //         width: 10.w,
                        //         height: 10.w,
                        //         child: Image.asset(
                        //           "assets/images/non-veg-marker.png",
                        //           scale: 4,
                        //         ),
                        //       )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${recipe.cookTime} mins",
                          style: TextStyle(
                            color: black,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        h(width: 2.w),
                        Icon(
                          Icons.access_time,
                          size: 12.sp,
                          color: hintGrey,
                        ),
                      ],
                    )
                  ],
                ),
                v(height: 2.h),
                Text(
                  "Protein: ${recipe.protein?.toStringAsFixed(2) ?? 0} g",
                  style: TextStyle(
                    color: grey,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Fat: ${recipe.fat?.toStringAsFixed(2) ?? 0} kcal",
                  style: TextStyle(
                    color: grey,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Carbs: ${recipe.carbohydrates?.toStringAsFixed(2) ?? 0} g",
                  style: TextStyle(
                    color: grey,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
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
