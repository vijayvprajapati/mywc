import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData appTheme = ThemeData(
  // primaryColor: AppColor.primaryColor,
  // scaffoldBackgroundColor: AppColor.transparent,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  //fontFamily: defaultFontFamily,
  useMaterial3: false,
  appBarTheme: AppBarTheme(
    //color: AppColor.primaryColor,
    iconTheme: const IconThemeData(
        //color: AppColor.white,
        size: 30.0),
    toolbarTextStyle: TextTheme(
            // titleLarge: textBold,
            )
        .bodyMedium,
    titleTextStyle: TextTheme(
            // titleLarge: textBold,
            )
        .titleLarge,
  ),
  buttonTheme: const ButtonThemeData(
      // buttonColor: AppColor.buttonColor,
      //disabledColor: AppColor.lightGray,
      ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
      // secondary: AppColor.brownColor,
      ),
  scrollbarTheme: ScrollbarThemeData(
    thumbVisibility: MaterialStateProperty.all<bool>(true),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    // backgroundColor: AppColor.scaffoldBgColor2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: const Radius.circular(15).r,
      ),
    ),
  ),
);
