//This class will define  some common utility function which used for app

import 'package:flutter/material.dart';
import 'package:mywc/locator/locator.dart';
import 'package:mywc/router/app_router.dart';
import 'package:mywc/values/colors.dart';
import 'package:mywc/widgets/app_bottom_sheet.dart';
import 'package:mywc/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
  //to show acknowledge message for user action
  static void showMessage({
    required String content,
  }) {
    // ScaffoldMessenger.of(locator<AppRouter>().navigatorKey.currentContext!)
    //     .showSnackBar(SnackBar(
    //   behavior: SnackBarBehavior.floating,
    //   // padding: EdgeInsets.all(10).r,
    //   duration: const Duration(milliseconds: 1500),
    //   margin:
    //       EdgeInsets.only(bottom: 1.sh - 1.sh * .12, right: 15.r, left: 15.r),
    //   content: AppText(text: content, textColor: AppColors.white),
    //   backgroundColor: AppColors.primaryColor,
    // ));
  }

//function used to show bottom model sheet
  static Future<void> showCustomBottomModelSheet(
      {required Widget child}) async {
    // await showModalBottomSheet(
    //     context: locator<AppRouter>().navigatorKey.currentContext!,
    //     builder: (context) {
    //       return AppBottomSheet(child: child);
    //     });
  }
}
