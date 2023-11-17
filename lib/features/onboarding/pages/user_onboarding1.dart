import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eatwise/constants.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../auth/provider/user_provider.dart';

class UserOnboardingPage1 extends StatefulWidget {
  const UserOnboardingPage1({super.key});

  @override
  State<UserOnboardingPage1> createState() => _UserOnboardingPage1State();
}

class _UserOnboardingPage1State extends State<UserOnboardingPage1> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final ageController = TextEditingController();
  final bmiController = TextEditingController();
  final allergiesController = TextEditingController();

  String? selectedGender;

  List<String> allergies = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    heightController.dispose();
    weightController.dispose();
    ageController.dispose();
    bmiController.dispose();
    allergiesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "EatWise",
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                v(height: 8.h),
                Text("Welcome to EatWise Altamash! Let's get you set up.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    )),
                v(height: 15.h),
                const Divider(
                  color: white,
                  thickness: 1.5,
                ),
                v(height: 15.h),
                Text(
                  "Personal Health Info",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
                v(height: 15.h),
                Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 40.h,
                        child: TextField(
                          controller: heightController,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.r)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.r)),
                              hintText: "Height (cm)",
                              alignLabelWithHint: true,
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                                color: hintGrey,
                              )),
                          onSubmitted: (value) {
                            if (heightController.text.isNotEmpty &&
                                weightController.text.isNotEmpty) {
                              double height =
                                  double.parse(heightController.text);
                              double weight =
                                  double.parse(weightController.text);
                              double bmi =
                                  weight / ((height / 100) * (height / 100));
                              bmiController.text = bmi.toStringAsFixed(2);
                            }
                          },
                        ),
                      ),
                    ),
                    h(width: 16.w),
                    Flexible(
                        child: SizedBox(
                      height: 40.h,
                      child: TextField(
                        controller: weightController,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.r)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.r)),
                            hintText: "Weight (kg)",
                            alignLabelWithHint: true,
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: hintGrey,
                            )),
                        onSubmitted: (value) {
                          if (heightController.text.isNotEmpty &&
                              weightController.text.isNotEmpty) {
                            double height = double.parse(heightController.text);
                            double weight = double.parse(weightController.text);
                            double bmi =
                                weight / ((height / 100) * (height / 100));
                            bmiController.text = bmi.toStringAsFixed(2);
                          }
                        },
                      ),
                    ))
                  ],
                ),
                v(height: 12.h),
                Row(
                  children: [
                    Flexible(
                        child: SizedBox(
                      height: 40.h,
                      width: 84.w,
                      child: TextField(
                        controller: ageController,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8.r)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8.r)),
                          hintText: "Age",
                          alignLabelWithHint: true,
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: hintGrey,
                          ),
                        ),
                      ),
                    )),
                    h(width: 16.w),
                    Flexible(
                        child: SizedBox(
                      height: 40.h,
                      width: 211.w,
                      child: TextField(
                        controller: bmiController,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: white,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8.r)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8.r)),
                          hintText: "BMI",
                          alignLabelWithHint: true,
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: hintGrey,
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
                v(height: 25.h),
                Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: white,
                  ),
                ),
                v(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 'Male',
                          groupValue: selectedGender,
                          activeColor: white,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                              debugPrint(selectedGender!);
                            });
                          },
                        ),
                        Text('Male',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: white,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Female',
                          groupValue: selectedGender,
                          activeColor: white,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                              debugPrint(selectedGender!);
                            });
                          },
                        ),
                        Text('Female',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: white,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 'Other',
                          activeColor: white,
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                              debugPrint(selectedGender!);
                            });
                          },
                        ),
                        Text('Other',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: white,
                            )),
                      ],
                    ),
                  ],
                ),
                v(height: 12.h),
                Text(
                  "Are you allergic to any Food Items?",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
                v(height: 8.h),
                SizedBox(
                  height: 40.h,
                  child: TextField(
                    controller: allergiesController,
                    textAlignVertical: TextAlignVertical.center,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.r)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.r)),
                      hintText: "Type here... (enter to add to list)",
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: hintGrey,
                      ),
                    ),
                    onSubmitted: (value) {
                      allergies.add(value);
                      setState(() {});
                      allergiesController.clear();
                    },
                  ),
                ),
                allergies.isEmpty
                    ? const SizedBox()
                    : Wrap(
                        spacing: 8.w,
                        // runSpacing: 4.h,
                        children: List.generate(
                          allergies.length,
                          (index) => Chip(
                            label: Text(
                              allergies[index],
                              style: TextStyle(
                                color: white,
                              ),
                            ),
                            backgroundColor: darkGreen,
                            onDeleted: () {
                              setState(() {
                                allergies.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ),
                v(height: 50.h),
                SizedBox(
                  width: double.infinity,
                  height: 35.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (heightController.text.isNotEmpty &&
                          weightController.text.isNotEmpty &&
                          ageController.text.isNotEmpty &&
                          bmiController.text.isNotEmpty &&
                          selectedGender != null &&
                          allergies.isNotEmpty) {
                        userProvider.user!.height =
                            double.parse(heightController.text);
                        userProvider.user!.weight =
                            double.parse(weightController.text);
                        userProvider.user!.age = int.parse(ageController.text);
                        userProvider.user!.BMI =
                            double.parse(bmiController.text);
                        userProvider.user!.gender = selectedGender;
                        userProvider.user!.allergies = allergies;
                        FirebaseFirestore.instance
                            .collection("users")
                            .doc(userProvider.user!.uid)
                            .update(userProvider.user!.toMap());
                        GoRouter.of(context).push("/user-onboarding2");
                      } else {
                        debugPrint(heightController.text.isNotEmpty.toString());
                        debugPrint(weightController.text.isNotEmpty.toString());
                        debugPrint(ageController.text.isNotEmpty.toString());
                        debugPrint(bmiController.text.isNotEmpty.toString());
                        debugPrint(selectedGender != null ? "true" : "false");
                        debugPrint(allergies.isNotEmpty.toString());
                        Fluttertoast.showToast(
                            msg: "Please fill all fields",
                            backgroundColor: black.withOpacity(0.6));
                      }
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      elevation: 2.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
