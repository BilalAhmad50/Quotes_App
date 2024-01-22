import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes/const/sizedbox_ext.dart';
import 'package:quotes/const/style.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Text(
            'Favorites',
            style: AppStyle.heading24blackw500,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 42.w, top: 20.h),
        child: Column(
          children: [
            Image(image: AssetImage('assets/3.png')),
            24.h.sbh,
            Image(image: AssetImage('assets/2.png')),
            24.h.sbh,
            Image(image: AssetImage('assets/1.png'))
          ],
        ),
      ),
    );
  }
}
