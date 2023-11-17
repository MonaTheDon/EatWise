import 'package:eatwise/constants.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
              "My Profile",
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
            Icon(MdiIcons.account,
            size: 70.sp,
            color: grey,),
            // v(height: 1.sp),
            Text("Altamash",
            textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.w500,
                color: white,
              ),
            ),
            v(height: 2.sp),
            const Divider(
              color: white,
              thickness: 2,
            ),
          ]
        )
          )
      ),
    );
  }
}