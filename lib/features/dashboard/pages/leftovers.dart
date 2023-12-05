import 'dart:math';

import 'package:eatwise/constants.dart';
import 'package:eatwise/features/auth/provider/user_provider.dart';
import 'package:eatwise/features/dashboard/provider/recipe_provider.dart';
import 'package:eatwise/features/dashboard/widgets/recipe_card.dart';
import 'package:eatwise/features/dashboard/widgets/smart_fridge_recipe_card.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'recipe_detail_screen.dart';

class LeftOvers extends StatefulWidget {
  const LeftOvers({super.key});

  @override
  State<LeftOvers> createState() => _LeftOversState();
}

class _LeftOversState extends State<LeftOvers> {
  final ingredientController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              v(height: 15.h),
              Text(
                "Smart Fridge",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffe417E45),
                ),
              ),
              // v(height: 5.h),
              const Divider(
                color: Color(0xffeD9D9D9),
                thickness: 2,
              ),
              v(height: 12.h),
              ingredientController.text.isEmpty
                  ? Text(
                      "Got LeftOvers? Discover recipes that pair perfectly with your remaining ingredients!",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffe417E45),
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
                      fillColor: Color(0xffe5DBB63),
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
                        color: white,
                      )),
                  onChanged: (value) {
                    setState(() {});
                    debugPrint(value);
                  },
                  onSubmitted: (value) {
                    recipeProvider.getRecipesbyIng(ingredientController.text);
                  },
                ),
              ),
              v(height: 30.sp),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RecipeInfoScreen(
                            recipe: recipeProvider.recipeWithIng[i],
                          ),
                        ),
                      );
                    },
                    child: SmartFridgeRecipeCard(
                        recipe: recipeProvider.recipeWithIng[i]),
                  );
                },
                separatorBuilder: (ctx, i) {
                  return v(height: 10.h);
                },
                itemCount: min(recipeProvider.recipeWithIng.length, 20),
              ),
              // SmartFridgeRecipeCard(recipe: recipeProvider.recipeWithIng[0]),
            ],
          ),
        ),
      ),
    );
  }
}
