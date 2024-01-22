import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes/const/sizedbox_ext.dart';
import 'package:quotes/const/style.dart';
import 'package:quotes/view/SettingScreen/Setting_row.dart';
import 'package:quotes/view/SettingScreen/custom_divider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: AppStyle.heading24blackw500,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          53.h.sbh,
          SettingRow(
            title: 'Tap Sound',
            switchValue: true,
            onSwitchChanged: (value) {},
          ),
          10.h.sbh,
          CustomDivider(),
          10.h.sbh,
          SettingRow(
            title: 'Notifications ',
            switchValue: true,
            onSwitchChanged: (value) {},
          ),
          10.h.sbh,
          CustomDivider(),
          10.h.sbh,
          SettingRow(
            title: 'Privacy Policy',
          ),
          10.h.sbh,
          CustomDivider(),
          10.h.sbh,
          SettingRow(
            title: 'Share App',
          ),
          10.h.sbh,
          CustomDivider(),
          10.h.sbh,
          SettingRow(
            title: 'Help',
          ),
          10.h.sbh,
          CustomDivider(),
        ],
      ),
    );
  }
}
