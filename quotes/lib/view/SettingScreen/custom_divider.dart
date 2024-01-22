
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
            color: Colors.black,
            thickness: 3,
            indent: 20,
            endIndent: 35,
          );
  }
}