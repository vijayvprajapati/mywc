import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywc/generated/assets.dart';
import 'package:mywc/ui/auth/login/login.dart';
import 'package:mywc/values/colors.dart';
import 'package:mywc/values/styles.dart';
import 'package:mywc/widgets/app_image.dart';
import 'package:mywc/widgets/app_text.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Container(
          width: 1.sw,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppImage(
                assets: Assets.assetsImagesAppLogo,
                height: 82.h,
                width: 126.w,
                isSvg: false,
              ),
              AppText(
                text: 'WiteCollar',
                textStyle: GoogleFonts.urbanist(
                  textStyle: AppStyles().textBold,
                  color: AppColors.white,
                ),
              ),
              AppText(
                text: '“We help close the gap”',
                textStyle: GoogleFonts.urbanist(
                  textStyle: AppStyles().textSemiBold,
                  color: AppColors.white.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
