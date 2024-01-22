import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes/const/style.dart';
import 'package:quotes/view/BottomNavigationBar/bnb.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CustomBottomNavigation(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/main logo.png',
              height: 340.h,
              width: 340.w,
            )),
            const Text.rich(TextSpan(children: [
              TextSpan(text: 'M', style: AppStyle.heading26blackw800),
              TextSpan(text: 'OTIVATIONAL', style: AppStyle.heading15blackw500),
              TextSpan(text: ' Q', style: AppStyle.heading26blackw800),
              TextSpan(text: 'UOTES', style: AppStyle.heading15blackw500),
            ])),
            const Text.rich(TextSpan(children: [
              TextSpan(text: 'A', style: AppStyle.heading26blackw800),
              TextSpan(text: 'pp', style: AppStyle.heading15blackw500)
            ])),
          ],
        ),
      ),
    );
  }
}
