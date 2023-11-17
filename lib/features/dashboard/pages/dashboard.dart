import 'package:eatwise/constants.dart';
import 'package:eatwise/features/dashboard/widgets/carousel_widget.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<RecipeProvider>(context, listen: false).getRecipesByUserPrefs(
        calories: userProvider.userNutrientsMap['calories'],
        proteins: userProvider.userNutrientsMap['protein'],
        carbohydrates: userProvider.userNutrientsMap['carbohydrates'],
        fat: userProvider.userNutrientsMap['fat'],
        energy: userProvider.userNutrientsMap['energy'],
        country: userProvider.user!.likedCuisines![0],
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
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
            CarouselWidget(
              recipe: recipeProvider.recipesByUserPrefs,
            ),
          ],
        ),
      )),
    );
  }
}
