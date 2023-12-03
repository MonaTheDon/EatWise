import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:eatwise/constants.dart';
import 'package:eatwise/features/auth/provider/user_provider.dart';
import 'package:eatwise/features/dashboard/pages/dashboard.dart';
import 'package:eatwise/features/dashboard/pages/matchmaker.dart';
import 'package:eatwise/features/dashboard/pages/leftovers.dart';
import 'package:eatwise/features/dashboard/pages/profile.dart';
import 'package:eatwise/features/dashboard/provider/nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context, listen: false).updateNutrientsMap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // extendBodyBehindAppBar: true,
      body: Consumer<NavBarProvider>(builder: (context, navBarProvider, child) {
        return IndexedStack(
          index: navBarProvider.currentIndex,
          children: const [
            LeftOvers(),
            MatchMaker(),
            MealPlanner(),
            Profile(),
          ],
        );
      }),
      bottomNavigationBar: Consumer<NavBarProvider>(
        builder: (context, navBarProvider, child) {
          return SizedBox(
            height: 110.h,
            // width: 200.w,
            child: DotNavigationBar(
              // margin: EdgeInsets.zero,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(4, 4),
                )
              ],
              dotIndicatorColor: Colors.transparent,
              splashColor: Colors.transparent,
              enableFloatingNavBar: true,
              enablePaddingAnimation: true,
              backgroundColor: white,
              itemPadding:
                  EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              currentIndex: navBarProvider.currentIndex,
              onTap: (value) {
                navBarProvider.currentIndex = value;
              },
              items: [
                DotNavigationBarItem(
                  icon: Icon(
                    MdiIcons.fridgeAlertOutline,
                    size: 26.sp,
                  ),
                  selectedColor: backgroundGreen,
                  unselectedColor: hintGrey,
                ),
                DotNavigationBarItem(
                  icon: Icon(
                    MdiIcons.foodAppleOutline,
                    size: 26.sp,
                  ),
                  selectedColor: backgroundGreen,
                  unselectedColor: hintGrey,
                ),
                DotNavigationBarItem(
                  icon: Icon(
                    MdiIcons.chefHat,
                    size: 26.sp,
                  ),
                  selectedColor: backgroundGreen,
                  unselectedColor: hintGrey,
                ),
                DotNavigationBarItem(
                  icon: Icon(
                    MdiIcons.account,
                    size: 26.sp,
                  ),
                  selectedColor: backgroundGreen,
                  unselectedColor: hintGrey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
