import 'package:eatwise/constants.dart';
import 'package:eatwise/features/dashboard/widgets/recipe_card.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftOvers extends StatefulWidget {
  const LeftOvers({super.key});

  @override
  State<LeftOvers> createState() => _LeftOversState();
}

class _LeftOversState extends State<LeftOvers> {
  final ingredientController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Smart LeftOver Manager",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.w500,
                color: white,
              ),
            ),
            v(height: 10.h),
            const Divider(
              color: white,
              thickness: 2,
            ),
            v(height: 12.h),
            ingredientController.text.isEmpty
                ? Text(
                    "Have some LeftOvers left? Find recipes which would go well with your Leftover Ingredients",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: white,
                    ),
                  )
                : const SizedBox(),
            v(height: 20.h),
            SizedBox(
              height: 40.h,
              child: TextField(
                controller: ingredientController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.r)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.r)),
                    hintText: "Type Ingredient Name",
                    alignLabelWithHint: true,
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: hintGrey,
                    )),
                onChanged: (value) {
                  setState(() {});
                  debugPrint(value);
                },
                onSubmitted: (value) {
                  
                },
              ),
            ),
            v(height: 30.sp),
            RecipeCard(),
          ],
        ),
      )),
    );
  }
}