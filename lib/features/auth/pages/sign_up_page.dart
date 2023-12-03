import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../models/app_user.dart';
import '../provider/auth_provider.dart';
import '../provider/user_provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confPasswordController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final allergiesController = TextEditingController();

  String? selectedGender;

  List<String> allergies = [];

  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confPasswordController.dispose();
    weightController.dispose();
    heightController.dispose();
    allergiesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: Icon(
                        Icons.keyboard_backspace,
                        size: 38.sp,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 24.w),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: black),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: black,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            v(height: 12.h),
                            Text(
                              "Basic Info",
                              style: TextStyle(
                                fontSize: 14.sp,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextFormField(
                              controller: nameController,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                filled: true,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: backgroundGreen,
                                    width: 2,
                                  ),
                                ),
                                fillColor: white,
                                hintText: "Full Name",
                                hintStyle: TextStyle(
                                  color: hintGrey,
                                ),
                              ),
                              style: const TextStyle(
                                color: black,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your Full Name";
                                }
                                return null;
                              },
                            ),
                            v(height: 12.h),
                            TextFormField(
                              controller: usernameController,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                filled: true,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: backgroundGreen,
                                    width: 2,
                                  ),
                                ),
                                fillColor: white,
                                hintText: "Username",
                                hintStyle: TextStyle(
                                  color: hintGrey,
                                ),
                              ),
                              style: const TextStyle(
                                color: black,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your username";
                                }
                                return null;
                              },
                            ),
                            v(height: 12.h),
                            TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                filled: true,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: backgroundGreen,
                                    width: 2,
                                  ),
                                ),
                                fillColor: white,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: hintGrey,
                                ),
                              ),
                              style: const TextStyle(
                                color: black,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your Password";
                                }
                                return null;
                              },
                            ),
                            v(height: 12.h),
                            TextFormField(
                              controller: confPasswordController,
                              textAlignVertical: TextAlignVertical.center,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                filled: true,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: backgroundGreen,
                                    width: 2,
                                  ),
                                ),
                                fillColor: white,
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                  color: hintGrey,
                                ),
                              ),
                              style: const TextStyle(
                                color: black,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your Password";
                                }
                                if (passwordController.text !=
                                    confPasswordController.text) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                            ),
                            v(height: 24.h),
                            Text(
                              "Personal Health Info",
                              style: TextStyle(
                                fontSize: 14.sp,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    controller: heightController,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      filled: true,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: backgroundGreen,
                                          width: 2,
                                        ),
                                      ),
                                      fillColor: white,
                                      hintText: "Height (cm)",
                                      hintStyle: TextStyle(
                                        color: hintGrey,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: black,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your Full Name";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                h(width: 12.w),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    controller: weightController,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      filled: true,
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: backgroundGreen,
                                          width: 2,
                                        ),
                                      ),
                                      fillColor: white,
                                      hintText: "Weight (kg)",
                                      hintStyle: TextStyle(
                                        color: hintGrey,
                                      ),
                                    ),
                                    style: const TextStyle(
                                      color: black,
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter your Full Name";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            v(height: 12.h),
                            Text(
                              "Gender",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: 'Male',
                                      groupValue: selectedGender,
                                      activeColor: backgroundGreen,
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
                                          // color: white,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 'Female',
                                      groupValue: selectedGender,
                                      activeColor: backgroundGreen,
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
                                          // color: white,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 'Other',
                                      activeColor: backgroundGreen,
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
                                          // color: b,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            v(height: 12.h),
                            Text(
                              "Are you allergic to anything?",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                            TextField(
                              controller: allergiesController,
                              textAlignVertical: TextAlignVertical.center,
                              // keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: white,
                                enabledBorder: const UnderlineInputBorder(
                                    // borderSide: BorderSide.none,
                                    // borderRadius: BorderRadius.circular(8.r)),
                                    ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: backgroundGreen,
                                    width: 2,
                                  ),
                                ),
                                hintText: "Type here... (Enter to add to list)",
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
                            allergies.isEmpty
                                ? const SizedBox()
                                : Wrap(
                                    spacing: 8.w,
                                    // runSpacing: 4.h,
                                    children: List.generate(
                                      allergies.length,
                                      (index) => Chip(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          side: const BorderSide(
                                              color: backgroundGreen),
                                        ),
                                        label: Text(
                                          allergies[index],
                                          style: const TextStyle(
                                            color: black,
                                          ),
                                        ),
                                        backgroundColor: white,
                                        onDeleted: () {
                                          setState(() {
                                            allergies.removeAt(index);
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                            v(height: 24.h),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff186EEF),
                                  foregroundColor: white,
                                  textStyle: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  elevation: 2.5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    final userCreds = await authProvider
                                        .registerUserWithEmail(
                                            usernameController.text,
                                            passwordController.text);
                                    if (userCreds != null) {
                                      final appUser = AppUser(
                                        uid: userCreds.user!.uid,
                                        name: nameController.text,
                                        username: usernameController.text,
                                        email:
                                            "${usernameController.text}@eatwise.com",
                                        allergies: allergies,
                                        height: double.parse(
                                            heightController.text.trim()),
                                        weight: double.parse(
                                            weightController.text.trim()),
                                        BMI: double.parse(
                                                weightController.text.trim()) /
                                            ((double.parse(heightController.text
                                                        .trim()) /
                                                    100) *
                                                (double.parse(heightController
                                                        .text
                                                        .trim()) /
                                                    100)),
                                      );
                                      debugPrint(appUser.toMap().toString());
                                      await AuthProvider.registerUser(appUser);
                                      userProvider.appUser = appUser;
                                      authProvider.setAuthenticated(
                                          true, userCreds.user);
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      if (mounted) {
                                        GoRouter.of(context)
                                            .push("/user-onboarding1");
                                      }
                                    }
                                  }
                                },
                                child: const Text("Continue"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
