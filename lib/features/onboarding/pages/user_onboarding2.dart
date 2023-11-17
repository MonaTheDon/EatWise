import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eatwise/constants.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../auth/provider/user_provider.dart';

class UserOnboardingPage2 extends StatefulWidget {
  const UserOnboardingPage2({super.key});

  @override
  State<UserOnboardingPage2> createState() => _UserOnboardingPage2State();
}

class _UserOnboardingPage2State extends State<UserOnboardingPage2> {
  String? selectedActivityLevel;
  String? selectedDietaryPreference;
  String? selectedHealthGoals;
  // String? selectedCuisine;

  List<String> cuisines = [
    "Indian",
    "Chinese",
    "Mediteranean",
    "Italian",
    "Mexican",
  ];

  List<String> tastes = [
    "Spicy",
    "Sweet",
    "Sour",
  ];

  List<String> selectedCuisines = [];
  List<String> selectedTastes = [];

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                v(height: 35.h),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "EatWise",
                    style: TextStyle(
                      fontSize: 36.sp,
                      color: white,
                    ),
                  ),
                ),
                v(height: 8.h),
                Text(
                  "Welcome to EatWise Altamash, Let's get you set up!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: white,
                  ),
                ),
                v(height: 15.h),
                const Divider(
                  color: white,
                  thickness: 1.5,
                ),
                v(height: 15.h),
                Text(
                  "What is your Activity Level",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                v(height: 12.h),
                DropdownButton2(
                  hint: Text(
                    "Select Activity Level",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: hintGrey,
                    ),
                  ),
                  value: selectedActivityLevel,
                  isExpanded: true,
                  buttonStyleData: ButtonStyleData(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  underline: SizedBox(),
                  // buttonStyleData: ButtonStyleData(),
                  dropdownStyleData: DropdownStyleData(
                      maxHeight: 200.h,
                      offset: const Offset(0, -10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color: selectedActivityLevel == null
                                  ? hintGrey
                                  : darkGreen))),
                  items: [
                    "Sedentary",
                    "Lightly Active",
                    "Moderately Active",
                    "Very Active",
                    "Extremely Active",
                  ]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedActivityLevel = value;
                    });
                  },
                ),
                v(height: 20.h),
                Text(
                  "Dietary Preferences",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                v(height: 12.h),
                DropdownButton2(
                  hint: Text(
                    "Select Dietary Preference",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: hintGrey,
                    ),
                  ),
                  value: selectedDietaryPreference,
                  isExpanded: true,
                  buttonStyleData: ButtonStyleData(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  underline: const SizedBox(),
                  // buttonStyleData: ButtonStyleData(),
                  dropdownStyleData: DropdownStyleData(
                      maxHeight: 200.h,
                      offset: const Offset(0, -10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color: selectedDietaryPreference == null
                                  ? hintGrey
                                  : darkGreen))),
                  items: [
                    "Vegetarian",
                    "Non-Vegetarian",
                    "Vegan",
                    "Omnivore",
                  ]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDietaryPreference = value;
                    });
                  },
                ),
                v(height: 20.h),
                Text(
                  "Do you have specific health goals?",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                v(height: 12.h),
                DropdownButton2(
                  hint: Text(
                    "Select Health Goals",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: hintGrey,
                    ),
                  ),
                  value: selectedHealthGoals,
                  isExpanded: true,
                  buttonStyleData: ButtonStyleData(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  underline: const SizedBox(),
                  // buttonStyleData: ButtonStyleData(),
                  dropdownStyleData: DropdownStyleData(
                      maxHeight: 200.h,
                      offset: const Offset(0, -10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color: selectedHealthGoals == null
                                  ? hintGrey
                                  : darkGreen))),
                  items: [
                    "Weight Loss",
                    "Muscle Gain",
                    "Maintain Current Weight",
                    "Improve overall well-being",
                    "None",
                  ]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedHealthGoals = value;
                    });
                  },
                ),
                v(height: 20.h),
                Text(
                  "Any Specific cuisine you like?",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                v(height: 12.h),
                DropdownButton2(
                  hint: Text(
                    "Select Cuisine",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: hintGrey,
                    ),
                  ),
                  // value: selectedCuisine,
                  isExpanded: true,

                  buttonStyleData: ButtonStyleData(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  underline: const SizedBox(),
                  // buttonStyleData: ButtonStyleData(),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200.h,
                    offset: const Offset(0, -10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      // border: Border.all(
                      //     color: selectedCuisine == null
                      //         ? hintGrey
                      //         : darkGreen),
                    ),
                  ),
                  items: cuisines
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: StatefulBuilder(
                            builder: (context, menuSetState) {
                              final isSelected = selectedCuisines.contains(e);
                              return InkWell(
                                onTap: () {
                                  isSelected
                                      ? selectedCuisines.remove(e)
                                      : selectedCuisines.add(e);
                                  setState(() {});
                                  menuSetState(() {});
                                },
                                child: Container(
                                  height: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    children: [
                                      if (isSelected)
                                        const Icon(Icons.check_box_outlined)
                                      else
                                        const Icon(
                                            Icons.check_box_outline_blank),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )))
                      .toList(),
                  value:
                      selectedCuisines.isEmpty ? null : selectedCuisines.last,
                  onChanged: (value) {},
                  selectedItemBuilder: (context) {
                    return selectedCuisines
                        .map((e) => Container(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                selectedCuisines.join(", "),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ))
                        .toList();
                  },
                ),
                v(height: 20.h),
                Text(
                  "Any specific food taste you like?",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                v(height: 12.h),
                DropdownButton2(
                  hint: Text(
                    "Select Tastes",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: hintGrey,
                    ),
                  ),
                  // value: selectedCuisine,
                  isExpanded: true,

                  buttonStyleData: ButtonStyleData(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  underline: const SizedBox(),
                  // buttonStyleData: ButtonStyleData(),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 200.h,
                    offset: const Offset(0, -10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      // border: Border.all(
                      //     color: selectedCuisine == null
                      //         ? hintGrey
                      //         : darkGreen),
                    ),
                  ),
                  items: tastes
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: StatefulBuilder(
                            builder: (context, menuSetState) {
                              final isSelected = selectedTastes.contains(e);
                              return InkWell(
                                onTap: () {
                                  isSelected
                                      ? selectedTastes.remove(e)
                                      : selectedTastes.add(e);
                                  setState(() {});
                                  menuSetState(() {});
                                },
                                child: Container(
                                  height: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    children: [
                                      if (isSelected)
                                        const Icon(Icons.check_box_outlined)
                                      else
                                        const Icon(
                                            Icons.check_box_outline_blank),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )))
                      .toList(),
                  value: selectedTastes.isEmpty ? null : selectedTastes.last,
                  onChanged: (value) {},
                  selectedItemBuilder: (context) {
                    return selectedTastes
                        .map((e) => Container(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                selectedTastes.join(", "),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ))
                        .toList();
                  },
                ),
                v(height: 38.h),
                SizedBox(
                  height: 35.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      userProvider.user!.activityLevel = selectedActivityLevel;
                      userProvider.user!.dietaryPreference =
                          selectedDietaryPreference;
                      userProvider.user!.healthGoal = selectedHealthGoals;
                      userProvider.user!.likedCuisines = selectedCuisines;
                      userProvider.user!.likedTastes = selectedTastes;
                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(userProvider.user!.uid)
                          .update(userProvider.user!.toMap());
                      while (GoRouter.of(context).canPop()) {
                        GoRouter.of(context).pop();
                      }
                      GoRouter.of(context).go('/home');
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                v(height: 50.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
