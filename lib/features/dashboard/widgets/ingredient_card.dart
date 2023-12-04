import 'package:eatwise/constants.dart';
import 'package:eatwise/models/entity.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IngredientCard extends StatelessWidget {
  final Entity entity;
  const IngredientCard({super.key,required this.entity});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 315.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        boxShadow:[ BoxShadow(
          blurRadius: 8,
          color: Colors.grey.withOpacity(0.25),
              offset: const Offset(4, 4),

        ),],
        color: white.withOpacity(0.6)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:[
            FittedBox(

              fit: BoxFit.scaleDown,
              child: SizedBox(
                width: 125.w,
                child: Text("${entity.entityName}",
                 maxLines: 1,
                 overflow: TextOverflow.ellipsis,       
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Colors.grey.withOpacity(0.25),
                              blurRadius: 4.0,
                              offset: Offset(3, 3)
                            )
                          ],
                          color: darkGreen,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
              ),
            ),
                  // v(height:1.h),
              Text("${entity.category}",
              style: TextStyle(
                      color: backgroundGreen,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    )
                  ]
          ),
          Row(children: [

            Text("Know More",
                    style: TextStyle(
                      color: backgroundGreen,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  h(width: 5.w),
                  Icon(MdiIcons.launch,
                  size: 18.sp,
                  color: darkGreen,
                  )
          ],)
        ],
      ),
    );
  }
}