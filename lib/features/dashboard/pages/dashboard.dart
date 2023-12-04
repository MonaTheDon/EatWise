import 'package:eatwise/constants.dart';
import 'package:eatwise/features/dashboard/pages/recipe_detail_screen.dart';
import 'package:eatwise/features/dashboard/widgets/carousel_widget.dart';
import 'package:eatwise/features/dashboard/widgets/recipe_card.dart';
import 'package:eatwise/features/dashboard/widgets/recipe_of_the_day_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils.dart';
import '../../auth/provider/user_provider.dart';
import '../provider/recipe_provider.dart';

class MealPlanner extends StatefulWidget {
  const MealPlanner({super.key});

  @override
  State<MealPlanner> createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    _isLoading = true;

    Provider.of<RecipeProvider>(context, listen: false).getRecipesByUserPrefs(
      calories: userProvider.userNutrientsMap['calories'],
      proteins: userProvider.userNutrientsMap['protein'],
      carbohydrates: userProvider.userNutrientsMap['carbohydrates'],
      fat: userProvider.userNutrientsMap['fat'],
      energy: userProvider.userNutrientsMap['energy'],
      country: userProvider.user!.likedCuisines![0],
    );
    Provider.of<RecipeProvider>(context, listen: false).getRecipeOfTheDay();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: backgroundGreen,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  v(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nutrition Plans",
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                            color: backgroundGreen,
                          ),
                        ),
                        // v(height: 11.h),
                        const Divider(
                          color: hintGrey,
                          thickness: 1,
                        ),
                        Text(
                          "Curated recipes for you",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            // color: hintGrey,
                          ),
                        ),
                        v(height: 8.h),
                        Text(
                          "Hungry? Let's see what we have for you!",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: backgroundGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // RecipeCard(recipe: recipeProvider.recipesByUserPrefs[0]),
                  SizedBox(
                    height: 195.h,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 24.w),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RecipeInfoScreen(
                                      recipe: recipeProvider
                                          .recipesByUserPrefs[index],
                                    )));
                          },
                          child: RecipeCard(
                              recipe: recipeProvider.recipesByUserPrefs[index]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return h(width: 10.w);
                      },
                      itemCount: recipeProvider.recipesByUserPrefs.length,
                    ),
                  ),
                  v(height: 14.h),
                  Divider(
                    color: hintGrey,
                    thickness: 1,
                    indent: 24.w,
                    endIndent: 24.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recipe of the Day",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            // color: hintGrey,
                          ),
                        ),
                        v(height: 8.h),
                        Text(
                          "Craving extraordinary eats. What's today's recipe?",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: backgroundGreen,
                          ),
                        ),
                        v(height: 14.h),
                        RecipeOfTheDay(recipe: recipeProvider.recipeOfTheDay),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
