import 'package:eatwise/features/dashboard/provider/nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        Consumer<NavBarProvider>(builder: (context, navBarProvider, child) {
      return IndexedStack(
        index: navBarProvider.currentIndex,
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      );
    }), bottomNavigationBar:
        Consumer<NavBarProvider>(builder: (context, navBarProvider, child) {
      return SizedBox(
        height: 55.h,
        child: BottomNavigationBar(
          currentIndex: navBarProvider.currentIndex,
          onTap: (value) {
            navBarProvider.currentIndex = value;
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.fridgeAlertOutline,
                size: 30.sp,
              ),
              label: "LeftOvers",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  MdiIcons.foodAppleOutline,
                  size: 30.sp,
                ),
                label: "MatchMaker"),
            BottomNavigationBarItem(
                icon: Icon(
                  MdiIcons.chefHat,
                  size: 30.sp,
                ),
                label: "MealPlanner"),
            BottomNavigationBarItem(
                icon: Icon(
                  MdiIcons.account,
                  size: 30.sp,
                ),
                label: "My Profile"),
          ],
        ),
      );
    }));
  }
}
