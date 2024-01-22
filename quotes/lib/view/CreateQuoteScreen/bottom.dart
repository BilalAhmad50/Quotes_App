import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomBarButton('assets/c1.svg', 'Quote', 0),
          _buildBottomBarButton('assets/c2.svg', 'Background', 1),
          _buildBottomBarButton('assets/c3.svg', 'Style', 2),
          _buildBottomBarButton('assets/c4.svg', 'Font color', 3),
        ],
      ),
    );
  }

  Widget _buildBottomBarButton(String iconPath, String label, int index) {
    return InkWell(
      onTap: () {
        onTabSelected(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 24,
            width: 24,
            color: selectedIndex == index ? Colors.red : Colors.black,
          ),
          Text(
            label,
            style: TextStyle(
              color: selectedIndex == index ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
