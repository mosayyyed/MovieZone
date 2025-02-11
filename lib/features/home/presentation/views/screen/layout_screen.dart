import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/themes/app_colors.dart';

import '../../../../../core/themes/app_assets.dart';
import '../widgets/explore/explore_app_bar.dart';
import 'explore_screen.dart';
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
            icon: SvgPicture.asset(
              AppAssets.icons.home,
              color: _selectedTab == _SelectedTab.home
                  ? AppColors.kPrimaryColor
                  : Colors.white,
            ),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.icons.discover,
              color: _selectedTab == _SelectedTab.search
                  ? AppColors.kPrimaryColor
                  : Colors.white,
            ),
            label: 'إستكشف',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.icons.bookmark,
              color: _selectedTab == _SelectedTab.favorite
                  ? AppColors.kPrimaryColor
                  : Colors.white,
            ),
            label: 'المفضلة',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.icons.profile,
              color: _selectedTab == _SelectedTab.person
                  ? AppColors.kPrimaryColor
                  : Colors.white,
            ),
            label: 'حسابي',
          ),
        ],
      ),
      appBar: _selectedTab == _SelectedTab.home
          ? null
          : CustomAppBar(
              title: _selectedTab == _SelectedTab.search
                  ? 'إستكشف'
                  : _selectedTab == _SelectedTab.favorite
                      ? 'المفضلة'
                      : 'حسابي',
            ),
      body: IndexedStack(
        index: _SelectedTab.values.indexOf(_selectedTab),
        children: [
          HomeScreen(),
          ExploreScreen(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                    width: double.infinity, height: 50, color: Colors.green),

                // This child ignores parent padding.
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: OverflowBox(
                      maxWidth: MediaQuery.of(context).size.width,
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          color: Colors.red)),
                ),
                Container(
                    width: double.infinity, height: 50, color: Colors.blue),
              ],
            ),
          ),
          Center(child: Text('حسابي')),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, search, favorite, person }
