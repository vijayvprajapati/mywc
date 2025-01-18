import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_button.dart';
import 'app_dot_indicator.dart';
import 'app_image.dart';
import 'app_text.dart';

class AppIntroWidget extends StatelessWidget {
  AppIntroWidget(
      {super.key,
      required this.pageList,
      required this.onPageChanged,
      required this.pageController,
      required this.indicatorHeight,
      required this.indicatorWidth,
      required this.activeColor,
      required this.inActiveColor,
      required this.btnBgColor,
      required this.onNextClick,
      required this.currentIndexNotifier});

  final List pageList;
  PageController pageController;
  final Function(int) onPageChanged;
  final ValueNotifier<int> currentIndexNotifier;
  final double indicatorHeight;
  final double indicatorWidth;
  final Color activeColor;
  final Color inActiveColor;
  final VoidCallback onNextClick;
  final Color btnBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20).r,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: pageList.length,
              controller: pageController,
              itemBuilder: (context, index) {
                pageController.addListener(() {
                  currentIndexNotifier.value =
                      pageController.page?.round() ?? 0;
                });
                final model = pageList[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppImage(
                      assets: model.image,
                      //isSvg: false,
                      height: 300.h,
                      width: 300.h,
                      boxFit: BoxFit.cover,
                    ),
                    // 10.verticalSpace,
                    AppText(
                        text: model.title ?? '',
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle()),
                    15.verticalSpace,
                    AppText(
                        text: model.subTitle ?? '',
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle()),
                  ],
                );
              },
              onPageChanged: onPageChanged,
            ),
          ),
          20.verticalSpace,
          ValueListenableBuilder(
              valueListenable: currentIndexNotifier,
              builder: (context, value, child) {
                return Wrap(
                  children: List.generate(pageList.length, (index) {
                    return AppDotsIndicator(
                      currentIndex: currentIndexNotifier.value,
                      index: index,
                      activeColor: activeColor,
                      inActiveColor: inActiveColor,
                      height: 8,
                      width: 8,
                    );
                  }),
                );
              }),
          20.verticalSpace,
          AppButton(
              btnTitle: 'Next',
              onClick: onNextClick,
              borderRadius: 15,
              btnWidth: 1.sw,
              btnBgColor: btnBgColor),
        ],
      ),
    );
  }
}
