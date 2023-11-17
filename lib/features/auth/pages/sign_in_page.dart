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

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            v(height: 100.h),
            Text(
              "EatWise",
              style: TextStyle(
                fontSize: 36.sp,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
            Text(
              "Your Health Companion",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: white,
              ),
            ),
            v(height: 25.h),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                        hintText: "Username",
                        hintStyle: const TextStyle(
                          color: hintGrey,
                        ),
                      ),
                      style: const TextStyle(
                        color: black,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email";
                        }
                        return null;
                      },
                    ),
                  ),
                  v(height: 13.h),
                  SizedBox(
                    height: 40.h,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      textAlignVertical: TextAlignVertical.center,
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
                          return "Please enter your password";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            v(height: 39.h),
            SizedBox(
              width: double.infinity,
              height: 38.h,
              child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final userCreds = await authProvider.signInWithEmail(
                        usernameController.text,
                        passwordController.text,
                      );
                      if (userCreds != null) {
                        final user =
                            await AuthProvider.getUser(userCreds.user!.uid);
                        if (user != null) {
                          userProvider.appUser = user;
                          if (mounted) GoRouter.of(context).go("/home");
                        } else {
                          Fluttertoast.showToast(msg: "User not found");
                        }
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 2.5,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: white,
                    ),
                  )),
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).go("/sign-up");
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
                    text: "Sign Up",
                    style: TextStyle(
                      color: darkGreen,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )),
            ),
            v(height: 25.h),
          ],
        ),
      ),
    ));
  }
}
