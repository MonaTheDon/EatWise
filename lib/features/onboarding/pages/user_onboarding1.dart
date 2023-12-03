import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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

  // String? selectedGender;
  String? selectedActivityLevel;
  String? selectedDietaryPreference;
  String? selectedHealthGoals;

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

  // List<String> allergies = [];

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
    // return Scaffold(
    //   body: SafeArea(
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 24.h),
    //       child: SingleChildScrollView(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Container(
    //               width: double.infinity,
    //               alignment: Alignment.center,
    //               child: Text(
    //                 "EatWise",
    //                 style: TextStyle(
    //                   fontSize: 36.sp,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //             ),
    //             v(height: 8.h),
    //             Text("Welcome to EatWise Altamash! Let's get you set up.",
    //                 textAlign: TextAlign.center,
    //                 style: TextStyle(
    //                   fontSize: 18.sp,
    //                   fontWeight: FontWeight.w400,
    //                   color: Colors.white,
    //                 )),
    //             v(height: 15.h),
    //             const Divider(
    //               color: white,
    //               thickness: 1.5,
    //             ),
    //             v(height: 15.h),
    //             Text(
    //               "Personal Health Info",
    //               style: TextStyle(
    //                 fontSize: 18.sp,
    //                 fontWeight: FontWeight.w500,
    //                 color: white,
    //               ),
    //             ),
    //             v(height: 15.h),
    //             Row(
    //               children: [
    //                 Flexible(
    //                   child: SizedBox(
    //                     height: 40.h,
    //                     child: TextField(
    //                       controller: heightController,
    //                       textAlignVertical: TextAlignVertical.center,
    //                       keyboardType: TextInputType.number,
    //                       decoration: InputDecoration(
    //                           filled: true,
    //                           fillColor: white,
    //                           enabledBorder: OutlineInputBorder(
    //                               borderSide: BorderSide.none,
    //                               borderRadius: BorderRadius.circular(8.r)),
    //                           focusedBorder: OutlineInputBorder(
    //                               borderSide: BorderSide.none,
    //                               borderRadius: BorderRadius.circular(8.r)),
    //                           hintText: "Height (cm)",
    //                           alignLabelWithHint: true,
    //                           hintStyle: TextStyle(
    //                             fontSize: 16.sp,
    //                             color: hintGrey,
    //                           )),
    //                       onSubmitted: (value) {
    //                         if (heightController.text.isNotEmpty &&
    //                             weightController.text.isNotEmpty) {
    //                           double height =
    //                               double.parse(heightController.text);
    //                           double weight =
    //                               double.parse(weightController.text);
    //                           double bmi =
    //                               weight / ((height / 100) * (height / 100));
    //                           bmiController.text = bmi.toStringAsFixed(2);
    //                         }
    //                       },
    //                     ),
    //                   ),
    //                 ),
    //                 h(width: 16.w),
    //                 Flexible(
    //                     child: SizedBox(
    //                   height: 40.h,
    //                   child: TextField(
    //                     controller: weightController,
    //                     textAlignVertical: TextAlignVertical.center,
    //                     keyboardType: TextInputType.number,
    //                     decoration: InputDecoration(
    //                         filled: true,
    //                         fillColor: white,
    //                         enabledBorder: OutlineInputBorder(
    //                             borderSide: BorderSide.none,
    //                             borderRadius: BorderRadius.circular(8.r)),
    //                         focusedBorder: OutlineInputBorder(
    //                             borderSide: BorderSide.none,
    //                             borderRadius: BorderRadius.circular(8.r)),
    //                         hintText: "Weight (kg)",
    //                         alignLabelWithHint: true,
    //                         hintStyle: TextStyle(
    //                           fontSize: 16.sp,
    //                           color: hintGrey,
    //                         )),
    //                     onSubmitted: (value) {
    //                       if (heightController.text.isNotEmpty &&
    //                           weightController.text.isNotEmpty) {
    //                         double height = double.parse(heightController.text);
    //                         double weight = double.parse(weightController.text);
    //                         double bmi =
    //                             weight / ((height / 100) * (height / 100));
    //                         bmiController.text = bmi.toStringAsFixed(2);
    //                       }
    //                     },
    //                   ),
    //                 ))
    //               ],
    //             ),
    //             v(height: 12.h),
    //             Row(
    //               children: [
    //                 Flexible(
    //                     child: SizedBox(
    //                   height: 40.h,
    //                   width: 84.w,
    //                   child: TextField(
    //                     controller: ageController,
    //                     textAlignVertical: TextAlignVertical.center,
    //                     keyboardType: TextInputType.number,
    //                     decoration: InputDecoration(
    //                       filled: true,
    //                       fillColor: white,
    //                       enabledBorder: OutlineInputBorder(
    //                           borderSide: BorderSide.none,
    //                           borderRadius: BorderRadius.circular(8.r)),
    //                       focusedBorder: OutlineInputBorder(
    //                           borderSide: BorderSide.none,
    //                           borderRadius: BorderRadius.circular(8.r)),
    //                       hintText: "Age",
    //                       alignLabelWithHint: true,
    //                       hintStyle: TextStyle(
    //                         fontSize: 16.sp,
    //                         color: hintGrey,
    //                       ),
    //                     ),
    //                   ),
    //                 )),
    //                 h(width: 16.w),
    //                 Flexible(
    //                     child: SizedBox(
    //                   height: 40.h,
    //                   width: 211.w,
    //                   child: TextField(
    //                     controller: bmiController,
    //                     textAlignVertical: TextAlignVertical.center,
    //                     keyboardType: TextInputType.number,
    //                     decoration: InputDecoration(
    //                       filled: true,
    //                       fillColor: white,
    //                       enabledBorder: OutlineInputBorder(
    //                           borderSide: BorderSide.none,
    //                           borderRadius: BorderRadius.circular(8.r)),
    //                       focusedBorder: OutlineInputBorder(
    //                           borderSide: BorderSide.none,
    //                           borderRadius: BorderRadius.circular(8.r)),
    //                       hintText: "BMI",
    //                       alignLabelWithHint: true,
    //                       hintStyle: TextStyle(
    //                         fontSize: 16.sp,
    //                         color: hintGrey,
    //                       ),
    //                     ),
    //                   ),
    //                 )),
    //               ],
    //             ),
    //             v(height: 25.h),
    //             Text(
    //               "Gender",
    //               style: TextStyle(
    //                 fontSize: 18.sp,
    //                 color: white,
    //               ),
    //             ),
    //             v(height: 8.h),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Row(
    //                   children: [
    //                     Radio(
    //                       value: 'Male',
    //                       groupValue: selectedGender,
    //                       activeColor: white,
    //                       onChanged: (value) {
    //                         setState(() {
    //                           selectedGender = value;
    //                           debugPrint(selectedGender!);
    //                         });
    //                       },
    //                     ),
    //                     Text('Male',
    //                         style: TextStyle(
    //                           fontSize: 16.sp,
    //                           fontWeight: FontWeight.w400,
    //                           color: white,
    //                         )),
    //                   ],
    //                 ),
    //                 Row(
    //                   children: [
    //                     Radio(
    //                       value: 'Female',
    //                       groupValue: selectedGender,
    //                       activeColor: white,
    //                       onChanged: (value) {
    //                         setState(() {
    //                           selectedGender = value;
    //                           debugPrint(selectedGender!);
    //                         });
    //                       },
    //                     ),
    //                     Text('Female',
    //                         style: TextStyle(
    //                           fontSize: 16.sp,
    //                           fontWeight: FontWeight.w400,
    //                           color: white,
    //                         )),
    //                   ],
    //                 ),
    //                 Row(
    //                   children: [
    //                     Radio(
    //                       value: 'Other',
    //                       activeColor: white,
    //                       groupValue: selectedGender,
    //                       onChanged: (value) {
    //                         setState(() {
    //                           selectedGender = value;
    //                           debugPrint(selectedGender!);
    //                         });
    //                       },
    //                     ),
    //                     Text('Other',
    //                         style: TextStyle(
    //                           fontSize: 16.sp,
    //                           fontWeight: FontWeight.w400,
    //                           color: white,
    //                         )),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //             v(height: 12.h),
    //             Text(
    //               "Are you allergic to any Food Items?",
    //               style: TextStyle(
    //                 fontSize: 18.sp,
    //                 fontWeight: FontWeight.w500,
    //                 color: white,
    //               ),
    //             ),
    //             v(height: 8.h),
    //             SizedBox(
    //               height: 40.h,
    //               child: TextField(
    //                 controller: allergiesController,
    //                 textAlignVertical: TextAlignVertical.center,
    //                 // keyboardType: TextInputType.number,
    //                 decoration: InputDecoration(
    //                   filled: true,
    //                   fillColor: white,
    //                   enabledBorder: OutlineInputBorder(
    //                       borderSide: BorderSide.none,
    //                       borderRadius: BorderRadius.circular(8.r)),
    //                   focusedBorder: OutlineInputBorder(
    //                       borderSide: BorderSide.none,
    //                       borderRadius: BorderRadius.circular(8.r)),
    //                   hintText: "Type here... (enter to add to list)",
    //                   alignLabelWithHint: true,
    //                   hintStyle: TextStyle(
    //                     fontSize: 16.sp,
    //                     color: hintGrey,
    //                   ),
    //                 ),
    //                 onSubmitted: (value) {
    //                   allergies.add(value);
    //                   setState(() {});
    //                   allergiesController.clear();
    //                 },
    //               ),
    //             ),
    //             allergies.isEmpty
    //                 ? const SizedBox()
    //                 : Wrap(
    //                     spacing: 8.w,
    //                     // runSpacing: 4.h,
    //                     children: List.generate(
    //                       allergies.length,
    //                       (index) => Chip(
    //                         label: Text(
    //                           allergies[index],
    //                           style: TextStyle(
    //                             color: black,
    //                           ),
    //                         ),
    //                         backgroundColor: white,
    //                         onDeleted: () {
    //                           setState(() {
    //                             allergies.removeAt(index);
    //                           });
    //                         },
    //                       ),
    //                     ),
    //                   ),
    //             v(height: 50.h),
    //             SizedBox(
    //               width: double.infinity,
    //               height: 35.h,
    //               child: ElevatedButton(
    //                 onPressed: () {
    //                   if (heightController.text.isNotEmpty &&
    //                       weightController.text.isNotEmpty &&
    //                       ageController.text.isNotEmpty &&
    //                       bmiController.text.isNotEmpty &&
    //                       selectedGender != null &&
    //                       allergies.isNotEmpty) {
    //                     userProvider.user!.height =
    //                         double.parse(heightController.text);
    //                     userProvider.user!.weight =
    //                         double.parse(weightController.text);
    //                     userProvider.user!.age = int.parse(ageController.text);
    //                     userProvider.user!.BMI =
    //                         double.parse(bmiController.text);
    //                     userProvider.user!.gender = selectedGender;
    //                     userProvider.user!.allergies = allergies;
    //                     FirebaseFirestore.instance
    //                         .collection("users")
    //                         .doc(userProvider.user!.uid)
    //                         .update(userProvider.user!.toMap());
    //                     GoRouter.of(context).push("/user-onboarding2");
    //                   } else {
    //                     debugPrint(heightController.text.isNotEmpty.toString());
    //                     debugPrint(weightController.text.isNotEmpty.toString());
    //                     debugPrint(ageController.text.isNotEmpty.toString());
    //                     debugPrint(bmiController.text.isNotEmpty.toString());
    //                     debugPrint(selectedGender != null ? "true" : "false");
    //                     debugPrint(allergies.isNotEmpty.toString());
    //                     Fluttertoast.showToast(
    //                         msg: "Please fill all fields",
    //                         backgroundColor: black.withOpacity(0.6));
    //                   }
    //                 },
    //                 child: Text(
    //                   "Continue",
    //                   style: TextStyle(
    //                     fontSize: 18.sp,
    //                     fontWeight: FontWeight.w600,
    //                     color: white,
    //                   ),
    //                 ),
    //                 style: ElevatedButton.styleFrom(
    //                   backgroundColor: backgroundBlue,
    //                   shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(8.r),
    //                   ),
    //                   elevation: 2.5,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              v(height: 32.h),
              Text(
                "Welcome to EatWise ${userProvider.user!.name}. We will help you set up",
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
              v(height: 12.h),
              const Divider(
                color: black,
                thickness: 1.5,
              ),
              v(height: 16.h),
              Text(
                "What is your Activity Level?",
                style: TextStyle(
                  fontSize: 16.sp,
                  // fontWeight: FontWeight.w500,
                ),
              ),
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
                    // color: white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                underline: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color:
                          selectedActivityLevel == null ? hintGrey : darkGreen,
                      width: 1.5,
                    ),
                  )),
                ),
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
              v(height: 16.h),
              Text(
                "Dietary Preferences?",
                style: TextStyle(
                  fontSize: 16.sp,
                  // fontWeight: FontWeight.w500,
                ),
              ),
              DropdownButton2(
                hint: Text(
                  "Select",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: hintGrey,
                  ),
                ),
                value: selectedDietaryPreference,
                isExpanded: true,
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    // color: white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                underline: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: selectedDietaryPreference == null
                          ? hintGrey
                          : darkGreen,
                      width: 1.5,
                    ),
                  )),
                ),
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
              v(height: 16.h),
              Text(
                "Do you have specific health goals?",
                style: TextStyle(
                  fontSize: 16.sp,
                  // fontWeight: FontWeight.w500,
                ),
              ),
              DropdownButton2(
                hint: Text(
                  "Health Goals",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: hintGrey,
                  ),
                ),
                value: selectedHealthGoals,
                isExpanded: true,
                buttonStyleData: ButtonStyleData(
                  decoration: BoxDecoration(
                    // color: white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                underline: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: selectedHealthGoals == null ? hintGrey : darkGreen,
                      width: 1.5,
                    ),
                  )),
                ),
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
              v(height: 16.h),
              Text(
                "Any Specific cuisine you like?",
                style: TextStyle(
                  fontSize: 16.sp,
                  // color: b,
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
                underline: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: selectedDietaryPreference == null
                          ? hintGrey
                          : darkGreen,
                      width: 1.5,
                    ),
                  )),
                ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    if (isSelected)
                                      const Icon(Icons.check_box_outlined)
                                    else
                                      const Icon(Icons.check_box_outline_blank),
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
                value: selectedCuisines.isEmpty ? null : selectedCuisines.last,
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
              v(height: 16.h),
              Text(
                "Any specific food taste you like?",
                style: TextStyle(
                  fontSize: 16.sp,
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
                underline: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: selectedDietaryPreference == null
                          ? hintGrey
                          : darkGreen,
                      width: 1.5,
                    ),
                  )),
                ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    if (isSelected)
                                      const Icon(Icons.check_box_outlined)
                                    else
                                      const Icon(Icons.check_box_outline_blank),
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
              v(height: 32.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedActivityLevel != null &&
                        selectedDietaryPreference != null &&
                        selectedHealthGoals != null &&
                        selectedCuisines.isNotEmpty &&
                        selectedTastes.isNotEmpty) {
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
                      GoRouter.of(context).go("/main-page");
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please fill all fields",
                          backgroundColor: black.withOpacity(0.6));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff186EEF),
                    foregroundColor: white,
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: const Text("Continue"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
