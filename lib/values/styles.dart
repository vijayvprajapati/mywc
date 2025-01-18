//This file contain all text styles required for text widget

import 'package:flutter/material.dart';
import 'package:mywc/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static const normal10Bold = TextStyle();

  final TextStyle textThin = TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w100,
    fontSize: 16.spMin,
    color: AppColors.black,
  );
  final TextStyle textExtraLight = TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w200,
    fontSize: 16.spMin,
    color: AppColors.black,
    overflow: TextOverflow.ellipsis,
  );
  final TextStyle textLight = TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w300,
    fontSize: 16.spMin,
    color: AppColors.black,
    overflow: TextOverflow.ellipsis,
  );
  final TextStyle textRegular = TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    fontSize: 16.spMin,
    color: AppColors.black,
    overflow: TextOverflow.ellipsis,
  );
  final TextStyle textMedium = TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w500,
    fontSize: 16.spMin,
    overflow: TextOverflow.ellipsis,
  );
  final TextStyle textSemiBold = TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w600,
    fontSize: 16.spMin,
    overflow: TextOverflow.ellipsis,
  );
  final TextStyle textBold = TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w700,
    fontSize: 16.spMin,
    overflow: TextOverflow.ellipsis,
  );
  final TextStyle textExtraBold = TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w800,
    fontSize: 16.spMin,
    overflow: TextOverflow.ellipsis,
  );
  final TextStyle textBlack = TextStyle(
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w900,
    fontSize: 26.spMin,
    overflow: TextOverflow.ellipsis,
  );
}
