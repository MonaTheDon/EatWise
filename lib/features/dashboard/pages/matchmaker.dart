import 'package:eatwise/constants.dart';
import 'package:eatwise/features/dashboard/widgets/carousel_widget.dart';
import 'package:eatwise/features/dashboard/widgets/ingredient_card.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchMaker extends StatefulWidget {
  const MatchMaker({super.key});

  @override
  State<MatchMaker> createState() => _MatchMakerState();
}

class _MatchMakerState extends State<MatchMaker> {
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
              "Ingredient Match Maker",
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
                    "Discover tasty pairings for your ingredient! Search and savor the flavor combo here.",
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
            IngredientCard()
          ],
        ),
      )),
    );
    ;
  }
}
