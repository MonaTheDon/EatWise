// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eatwise/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils.dart';

class ProcedureWidget extends StatelessWidget {
  final List<String> procedure;
  const ProcedureWidget({
    Key? key,
    required this.procedure,
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
              "${i + 1}. ${procedure[i]}",
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
        itemCount: procedure.length,
      ),
    );
    // return Text(
    //   procedure,
    //   style: TextStyle(
    //     color: white,
    //     fontSize: 16.sp,
    //     fontWeight: FontWeight.w400,
    //   ),
    // );
  }
}
