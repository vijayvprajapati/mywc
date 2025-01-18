import 'package:flutter/material.dart';

class BottomNavItemModel {
  final IconData? iconData;
  final String? iconPath;
  final String? label;
  final bool isSelected;
  final int? id;

  BottomNavItemModel(
      {this.id,
      this.iconData,
      this.iconPath,
      this.label,
      this.isSelected = false});
}
