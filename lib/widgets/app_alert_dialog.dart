//custom alert dialog for taking confirmation from user

import 'package:flutter/material.dart';
import 'package:mywc/router/app_router.dart';
import 'package:mywc/values/colors.dart';
import 'package:mywc/widgets/app_button.dart';
import 'package:mywc/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.buttonOkText,
      required this.buttonCancelText,
      this.onTapOkCallback,
      this.onTapCancelCallback});

  final String title;
  final String subTitle;
  final String buttonOkText;
  final String buttonCancelText;
  final VoidCallback? onTapOkCallback;
  final VoidCallback? onTapCancelCallback;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // insetPadding: EdgeInsets.all(10),
      // backgroundColor: AppColors.transparent,
      child: Container(
        height: 0.20.sh,
        padding: EdgeInsets.all(10.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(text: title, textSize: 18.r),
            10.verticalSpace,
            AppText(text: subTitle, textSize: 16.r),
            20.verticalSpace,
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppButton(
                  btnBgColor: AppColors.transparent,
                  btnTitle: buttonOkText,
                  btnTextColor: AppColors.black,
                  onClick: onTapOkCallback!,
                  btnWidth: 50.w,
                  btnHeight: 25.h,
                ),
                10.horizontalSpace,
                AppButton(
                  btnTitle: buttonCancelText,
                  btnBgColor: AppColors.transparent,
                  btnTextColor: AppColors.black,
                  onClick: () {
                   
                  },
                  btnWidth: 50.w,
                  btnHeight: 25.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
