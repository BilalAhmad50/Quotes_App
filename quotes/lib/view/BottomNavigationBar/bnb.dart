import 'package:flutter/material.dart';
import 'package:quotes/view/DownloadsScreen/download_screen.dart';
import 'package:quotes/view/FavoritesScreen/favorite_screen.dart';
import 'package:quotes/view/QuotesScreen/quote_Screen.dart';
import 'package:quotes/view/SettingScreen/setting_screen.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    QuoteScreen(),
    FavoriteScreen(),
    DownloadScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(0xff333334),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.red,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.format_quote_outlined,
                  color: _currentIndex == 0 ? Colors.red : Colors.white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: _currentIndex == 1 ? Colors.red : Colors.white,
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.download_outlined,
                  color: _currentIndex == 2 ? Colors.red : Colors.white,
                ),
                label: 'Download',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                  color: _currentIndex == 3 ? Colors.red : Colors.white,
                ),
                label: 'Setting',
              ),
            ],
          ),
        ));
  }
}
