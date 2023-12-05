import 'package:eatwise/constants.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../auth/provider/user_provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      v(height: 15.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Text(
          "My Profile",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xffe417E45),
          ),
        ),
      ),
      v(height: 8.h),
      Divider(
        color: Color(0xffeD9D9D9),
        thickness: 2,
        indent: 12.w,
        endIndent: 12.w,
      ),
      Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Icon(
          MdiIcons.account,
          size: 100.sp,
          color: grey,
        ),
      ),
      // v(height: 1.sp),

      Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "@${userProvider.user!.username}",
              style: TextStyle(
                fontSize: 15.sp,
                color: Color(0xffe417E45),
              ),
            ),
            v(height: 5.h),
            Text(
              userProvider.user?.name ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xffe417E45),
              ),
            ),
            Text(
              "India",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
                color: darkGreen,
              ),
            )
          ],
        ),
      ),
      v(height: 13.sp),
      Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffD9D9D9),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            v(height: 24.h),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 32.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "67",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: darkGreen,
                        ),
                      ),
                      Text(
                        "Liked Recipes",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: darkGreen,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "2",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: darkGreen,
                        ),
                      ),
                      Text(
                        "Reviews",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: darkGreen,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "19.5",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: darkGreen,
                        ),
                      ),
                      Text(
                        "BMI",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: darkGreen,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            v(height: 26.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text(
                "Liked Recipes",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            v(height: 4.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text(
                "Wanna go back to previous tried treats?",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: darkGreen,
                ),
              ),
            ),
          ]),
        ),
      )
    ]);
  }
}
