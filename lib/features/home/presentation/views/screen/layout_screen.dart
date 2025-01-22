import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';

import 'home_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        enableFeedback: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.kSecondaryColor,
        selectedItemColor: AppColors.kPrimaryColor,
        unselectedItemColor: Colors.white,
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 28),
            label: 'بحث',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, size: 28),
            label: 'المفضلة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 28),
            label: 'حسابي',
          ),
        ],
      ),
      body: IndexedStack(
        index: _SelectedTab.values.indexOf(_selectedTab),
        children: [
          HomeScreen(),
          Center(child: Text('بحث')),
          Center(child: Text('المفضلة')),
          Center(child: Text('حسابي')),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, favorite, search, person }
