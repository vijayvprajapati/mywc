//this is custom button widget for adding button in app
import 'package:flutter/material.dart';
import 'package:mywc/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.btnTitle,
    required this.onClick,
    this.btnBgColor,
    this.borderRadius,
    this.btnTextColor,
    this.btnHeight,
    this.btnWidth,
    this.btnElevation,
  });

  final String? btnTitle;
  final Color? btnBgColor;
  final Color? btnTextColor;

  final VoidCallback onClick;
  final double? borderRadius;
  final double? btnHeight;
  final double? btnWidth;
  final double? btnElevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: btnHeight ?? 40.h,
      width: btnWidth ?? 200.w,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
            elevation: btnElevation ?? 0.0,
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
            backgroundColor: btnBgColor,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(borderRadius ?? 0.0)))),
        child: AppText(
          text: btnTitle ?? '',
          textAlign: TextAlign.center,
          textColor: btnTextColor,
          //textStyle: AppStyles.normal10Bold,
        ),
      ),
    );
  }
}
