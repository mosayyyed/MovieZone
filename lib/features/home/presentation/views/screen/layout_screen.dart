import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/themes/app_colors.dart';

import '../../../../../core/themes/app_assets.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../explore/data/repositories/search_repo/search_movies_repo_impl.dart';
import '../../../../explore/presentation/controller/cast/search_cubit.dart';
import '../../../../explore/presentation/views/screen/explore_screen.dart';
import '../../../../explore/presentation/views/widgets/explore/explore_app_bar.dart';
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
          MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      SearchMoiveCubit(getIt.get<SearchMoviesRepoImpl>())),
            ],
            child: ExploreScreen(),
          ),
          Center(child: Text('المفضلة')),
          Center(child: Text('حسابي')),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, search, favorite, person }
