//Bottom navigation widget

import 'package:flutter/material.dart';
import 'package:mywc/data/model/others/bottom_nav_item.dart';
import 'package:mywc/values/colors.dart';

class AppBottomNavigation extends StatelessWidget {
  const AppBottomNavigation(
      {super.key,
      required this.currentIndex,
      required this.listItems,
      required this.onTap});

  final Function(int) onTap;
  final int currentIndex;
  final List<BottomNavItemModel> listItems;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: AppColors.black,
      unselectedItemColor: AppColors.grey,
      elevation: 0.0,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      iconSize: 25,
      // backgroundColor: AppColors.favColor,
      type: BottomNavigationBarType.fixed,
      items: listItems.map<BottomNavigationBarItem>((value) {
        return _bottomNavigationBarItem(model: value);
      }).toList(),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      {required BottomNavItemModel model}) {
    return BottomNavigationBarItem(
      icon: Icon(model.iconData,
          color: currentIndex == model.id ? AppColors.black : AppColors.grey),
      label: model.label,
    );
  }
}
