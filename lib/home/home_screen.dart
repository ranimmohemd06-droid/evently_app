import 'package:evently_app/home/tabs/favorite/favorite_tab.dart';
import 'package:evently_app/home/tabs/home/home_tab.dart';
import 'package:evently_app/home/tabs/map/map_tab.dart';
import 'package:evently_app/home/tabs/profile/profile_tab.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabList = [HomeTab(), MapTab(), FavoriteTab(), profileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          buildBottomNavBarItem(
            index: 0,
            iconSelectedName: AppAssets.iconHomeSelected,
            iconUnSelectedName: AppAssets.iconHome,
            label: AppLocalizations.of(context)!.home,
          ),
          buildBottomNavBarItem(
            index: 1,
            iconSelectedName: AppAssets.iconMapSelected,
            iconUnSelectedName: AppAssets.iconMapp,
            label: AppLocalizations.of(context)!.map,
          ),
          buildBottomNavBarItem(
            index: 2,
            iconSelectedName: AppAssets.iconFavoriteSelected,
            iconUnSelectedName: AppAssets.iconFavorite,
            label: AppLocalizations.of(context)!.favorite,
          ),
          buildBottomNavBarItem(
            index: 3,
            iconSelectedName: AppAssets.iconProfileSelected,
            iconUnSelectedName: AppAssets.iconProfile,
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.addEventRouteName);
        },
        child: Icon(Icons.add, size: 35, color: AppColors.whiteColor),
      ),
      body: tabList[selectedIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavBarItem({
    required String iconSelectedName,
    required String iconUnSelectedName,
    required int index,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          selectedIndex == index ? iconSelectedName : iconUnSelectedName,
        ),
      ),
      label: label,
    );
  }
}
