// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class IngredientsWidget extends StatelessWidget {
  final List<String> ingredientPhrases;
  const IngredientsWidget({
    Key? key,
    required this.ingredientPhrases,
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
              "${i + 1}. ${ingredientPhrases[i]}",
              style: TextStyle(
                color: white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
        separatorBuilder: (ctx, i) {
          return v(height: 4.h);
        },
        itemCount: ingredientPhrases.length,
      ),
    );
  }
}
