// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../utils.dart';

class UtensilsWidget extends StatelessWidget {
  final List<String> utensils;
  const UtensilsWidget({
    Key? key,
    required this.utensils,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (ctx, i) {
          return Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              "${i + 1}. ${utensils[i]}",
              style: TextStyle(
                color: black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
        separatorBuilder: (ctx, i) {
          return v(height: 4.h);
        },
        itemCount: utensils.length,
      ),
    );
  }
}
