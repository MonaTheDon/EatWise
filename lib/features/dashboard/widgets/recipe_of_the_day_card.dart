// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eatwise/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:eatwise/models/recipe.dart';

import '../../../utils.dart';

class RecipeOfTheDay extends StatelessWidget {
  final Recipe recipe;
  const RecipeOfTheDay({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return recipe.recipeId == null
        ? const Center(
            child: CircularProgressIndicator(
            color: backgroundGreen,
          ))
        : Container(
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(4, 4),
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(recipe.imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                h(width: 10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        recipe.recipeName ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12.sp,
                          // fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      "Worth having this dish!",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
  }
}
