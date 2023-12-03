import 'package:eatwise/constants.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../provider/user_provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    dispose() {
      usernameController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    // return Scaffold(
    //     body: SafeArea(
    //   child: Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 24.h),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       // mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         v(height: 100.h),
    //         Text(
    //           "EatWise",
    //           style: TextStyle(
    //             fontSize: 36.sp,
    //             fontWeight: FontWeight.bold,
    //             color: white,
    //           ),
    //         ),
    //         Text(
    //           "Your Health Companion",
    //           style: TextStyle(
    //             fontSize: 18.sp,
    //             fontWeight: FontWeight.w600,
    //             color: white,
    //           ),
    //         ),
    //         v(height: 25.h),
    //         Form(
    //           key: _formKey,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               SizedBox(
    //                 height: 40.h,
    //                 child: TextFormField(
    //                   controller: usernameController,
    //                   textAlignVertical: TextAlignVertical.center,
    //                   decoration: InputDecoration(
    //                     border: OutlineInputBorder(
    //                         borderSide: BorderSide.none,
    //                         borderRadius: BorderRadius.circular(8.r)),
    //                     filled: true,
    //                     fillColor: white,
    //                     hintText: "Username",
    //                     hintStyle: const TextStyle(
    //                       color: hintGrey,
    //                     ),
    //                   ),
    //                   style: const TextStyle(
    //                     color: black,
    //                   ),
    //                   validator: (value) {
    //                     if (value == null || value.isEmpty) {
    //                       return "Please enter your email";
    //                     }
    //                     return null;
    //                   },
    //                 ),
    //               ),
    //               v(height: 13.h),
    //               SizedBox(
    //                 height: 40.h,
    //                 child: TextFormField(
    //                   controller: passwordController,
    //                   obscureText: true,
    //                   textAlignVertical: TextAlignVertical.center,
    //                   decoration: InputDecoration(
    //                     border: OutlineInputBorder(
    //                         borderSide: BorderSide.none,
    //                         borderRadius: BorderRadius.circular(8.r)),
    //                     filled: true,
    //                     fillColor: white,
    //                     hintText: "Password",
    //                     hintStyle: const TextStyle(
    //                       color: hintGrey,
    //                     ),
    //                   ),
    //                   style: const TextStyle(
    //                     color: black,
    //                   ),
    //                   validator: (value) {
    //                     if (value == null || value.isEmpty) {
    //                       return "Please enter your password";
    //                     }
    //                     return null;
    //                   },
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         v(height: 39.h),
    //         SizedBox(
    //           width: double.infinity,
    //           height: 38.h,
    //           child: ElevatedButton(
    //               onPressed: () async {
    //                 if (_formKey.currentState!.validate()) {
    //                   final userCreds = await authProvider.signInWithEmail(
    //                     usernameController.text,
    //                     passwordController.text,
    //                   );
    //                   if (userCreds != null) {
    //                     final user =
    //                         await AuthProvider.getUser(userCreds.user!.uid);
    //                     if (user != null) {
    //                       userProvider.appUser = user;
    //                       if (mounted) GoRouter.of(context).go("/main-page");
    //                     } else {
    //                       Fluttertoast.showToast(msg: "User not found");
    //                     }
    //                   }
    //                 }
    //               },
    //               style: ElevatedButton.styleFrom(
    //                 backgroundColor: backgroundBlue,
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(8.r),
    //                 ),
    //                 elevation: 2.5,
    //               ),
    //               child: Text(
    //                 "Login",
    //                 style: TextStyle(
    //                   fontSize: 18.sp,
    //                   fontWeight: FontWeight.w600,
    //                   color: white,
    //                 ),
    //               )),
    //         ),
    //         const Expanded(child: SizedBox()),
    //         GestureDetector(
    //           onTap: () {
    //             GoRouter.of(context).go("/sign-up");
    //           },
    //           child: RichText(
    //               text: TextSpan(
    //             text: "Already a user? ",
    //             style: TextStyle(
    //               fontSize: 18.sp,
    //               fontWeight: FontWeight.w600,
    //               color: white,
    //             ),
    //             children: [
    //               TextSpan(
    //                 text: "Sign Up",
    //                 style: TextStyle(
    //                   color: darkGreen,
    //                   fontSize: 18.sp,
    //                   fontWeight: FontWeight.w600,
    //                 ),
    //               )
    //             ],
    //           )),
    //         ),
    //         v(height: 25.h),
    //       ],
    //     ),
    //   ),
    // ));
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            v(height: 18.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "EatWise",
                    style: TextStyle(
                      fontSize: 38.sp,
                      color: backgroundGreen,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push("/sign-up");
                    },
                    child: Container(
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
                  )
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(
                          color: hintGrey,
                          fontSize: 18.sp,
                        ),
                        border: const UnderlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 8,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: backgroundGreen, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        return null;
                      },
                    ),
                  ),
                  v(height: 18.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 34),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: hintGrey,
                          fontSize: 18.sp,
                        ),
                        border: const UnderlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 8,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: backgroundGreen, width: 2),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            v(height: 37.h),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 34),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final userCreds = await authProvider.signInWithEmail(
                      usernameController.text.trim(),
                      passwordController.text.trim(),
                    );
                    if (userCreds != null) {
                      final user =
                          await AuthProvider.getUser(userCreds.user!.uid);
                      if (user != null) {
                        userProvider.appUser = user;
                        if (mounted) GoRouter.of(context).go("/main-page");
                      } else {
                        Fluttertoast.showToast(msg: "User not found");
                      }
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff186EEF),
                  foregroundColor: white,
                  textStyle: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    // color: white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 2.5,
                ),
                child: const Text(
                  "Login",
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
