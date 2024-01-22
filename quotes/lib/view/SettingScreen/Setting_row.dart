import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes/const/style.dart';

class SettingRow extends StatelessWidget {
  final String title;
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  const SettingRow({
    Key? key,
    required this.title,
    this.switchValue,
    this.onSwitchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 53.w, right: 30.w),
      child: Column(
        children: [
          Row(
            children: [
              Text(title, style: AppStyle.heading24blackw400),
              const Spacer(),
              if (switchValue != null && onSwitchChanged != null)
                Switch(
                  value: switchValue!,
                  onChanged: onSwitchChanged!,
                  activeColor: Colors.white,
                  activeTrackColor: Colors.grey,
                  inactiveTrackColor: Colors.grey,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
