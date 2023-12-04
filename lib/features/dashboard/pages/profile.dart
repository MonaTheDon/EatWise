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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                child: Icon(MdiIcons.account,
                size: 100.sp,
                color: grey,),
              ),
              // v(height: 1.sp),
          
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                
                child: Column(
                  children: [
                    Text("@mona123",
                    style: TextStyle(
                        fontSize: 15.sp,
                        
                        color: Color(0xffe417E45),
                      ),
                    ),
                    v(height: 5.h),
          
                    Text("Tanisha Singh",
                    textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffe417E45),
                      ),
                    ),
                    Text("India",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.sp,
                        
                        color: Color(0xffe417E45),
                      ),
                    )
                  ],
                ),
              ),
              v(height: 2.sp),
              Expanded(
                child: Container(
                  color: Color(0xffeD9D9D9),
                ),
              )
            ]
          )
      ),
    );
  }
}