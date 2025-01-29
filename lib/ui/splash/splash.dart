import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywc/generated/assets.dart';
import 'package:mywc/generated/l10n.dart';
import 'package:mywc/ui/auth/login/login.dart';
import 'package:mywc/values/colors.dart';
import 'package:mywc/values/styles.dart';
import 'package:mywc/widgets/app_button.dart';
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
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            // alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                child: AppImage(
                  assets: Assets.assetsImagesWcBgSplash,
                  height: 0.58.sh,
                  width: 1.sw,
                  boxFit: BoxFit.fitHeight,
                  isSvg: false,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppImage(
                    assets: Assets.assetsImagesAppLogo,
                    height: 82.h,
                    width: 126.w,
                    isSvg: false,
                  ),
                  AppText(
                    text: S.current.witeCollar,
                    textStyle: GoogleFonts.urbanist(
                      textStyle: AppStyles().textBold,
                      color: AppColors.white,
                    ),
                  ),
                  AppText(
                    text: S.current.weHelpCloseTheGap,
                    textStyle: GoogleFonts.urbanist(
                      textStyle: AppStyles().textSemiBold,
                      color: AppColors.white.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15.r),
                  child: AppButton(
                    btnTitle: 'Get Started',
                    onClick: () {},
                    borderRadius: 65.r,
                    btnWidth: 0.8.sw,
                    btnBgColor: AppColors.buttonColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
