//custom dot indicator for using in intro screen page view or in other screen where needed
import 'package:flutter/material.dart';

class AppDotsIndicator extends StatelessWidget {
  const AppDotsIndicator({
    required this.currentIndex,
    required this.index,
    this.width,
    this.height,
    required this.activeColor,
    required this.inActiveColor,
    super.key,
  });

  final int currentIndex;
  final int index;
  final double? height;
  final double? width;
  final Color activeColor;
  final Color inActiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: height ?? 8,
      width: currentIndex == index ? width : width,
      margin: const EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: currentIndex == index ? activeColor : inActiveColor,
      ),
    );
  }
}
