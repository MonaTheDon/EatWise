import 'package:eatwise/constants.dart';
import 'package:eatwise/features/dashboard/pages/dashboard.dart';
import 'package:eatwise/features/onboarding/pages/user_onboarding1.dart';
import 'package:eatwise/features/onboarding/pages/user_onboarding2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'features/auth/pages/sign_in_page.dart';
import 'features/auth/pages/sign_up_page.dart';
import 'features/auth/provider/user_provider.dart';

import 'features/dashboard/pages/main_page.dart';
import 'features/dashboard/provider/nav_bar_provider.dart';
import 'firebase_options.dart';

import './features/auth/provider/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SignInPage(),
  ),
  GoRoute(
    path: "/sign-up",
    builder: (context, state) => const SignUpPage(),
  ),
  GoRoute(
    path: "/main-page",
    builder: (context, state) => const MainPage(),
  ),
  // GoRoute(
  //   path: "/home",
  //   builder: (context, state) => const Dashboard(),
  // ),
  GoRoute(
    path: "/user-onboarding1",
    builder: (context, state) => const UserOnboardingPage1(),
  ),
  GoRoute(
    path: "/user-onboarding2",
    builder: (context, state) => const UserOnboardingPage2(),
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => NavBarProvider())
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        minTextAdapt: true,
        builder: (_, child) => MaterialApp.router(
          title: 'EatWise',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: backgroundGreen,
            fontFamily: "Lexend",
          ),
          routerConfig: _router,
        ),
        // child: const SignInPage(),
      ),
    );
  }
}
