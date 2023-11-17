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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              v(height: 40.h),
              Text(
                "EatWise",
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              v(height: 24.h),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                        child: TextFormField(
                          controller: nameController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.r)),
                            filled: true,
                            fillColor: white,
                            hintText: "Full Name",
                            hintStyle: const TextStyle(
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
                      v(height: 16.h),
                      SizedBox(
                        height: 40.h,
                        child: TextFormField(
                          controller: usernameController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.r)),
                            filled: true,
                            fillColor: white,
                            hintText: "username",
                            hintStyle: const TextStyle(
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
                      ),
                      v(height: 16.h),
                      SizedBox(
                        height: 40.h,
                        child: TextFormField(
                          controller: passwordController,
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.r)),
                            filled: true,
                            fillColor: white,
                            hintText: "Password",
                            hintStyle: const TextStyle(
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
                      ),
                      v(height: 16.h),
                      SizedBox(
                        height: 40.h,
                        child: TextFormField(
                          controller: confPasswordController,
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8.r)),
                            filled: true,
                            fillColor: white,
                            hintText: "Confirm Password",
                            hintStyle: const TextStyle(
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
                      ),
                      v(height: 42.h),
                      SizedBox(
                        height: 35.h,
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                // final userCreds =
                                //     await authProvider.registerUserWithEmail(
                                //         usernameController.text,
                                //         passwordController.text);
                                // if (userCreds != null) {
                                //   final appUser = AppUser(
                                //     uid: userCreds.user!.uid,
                                //     name: nameController.text,
                                //     username: usernameController.text,
                                //   );
                                //   debugPrint(appUser.toMap().toString());
                                //   await AuthProvider.registerUser(appUser);

                                //   if (mounted) {
                                //     userProvider.appUser = appUser;
                                //     authProvider.setAuthenticated(
                                //         true, userCreds.user);
                                GoRouter.of(context).push("/user-onboarding1");
                                // }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: backgroundBlue,
                              elevation: 2.5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      // const Flexible(child: SizedBox()),
                      v(height: 60.h),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go("/");
                        },
                        child: RichText(
                            text: TextSpan(
                          text: "Already a user? ",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign In",
                              style: TextStyle(
                                color: darkGreen,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        )),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
