import 'package:flutter/material.dart';

import 'package:mywc/util/utils.dart';
import 'package:mywc/widgets/app_drawer.dart';
import 'package:mywc/widgets/app_text.dart';

import '../../data/model/others/bottom_nav_item.dart';
import '../../generated/l10n.dart';
import '../../widgets/app_bottom_navigation.dart';
import '../../widgets/app_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<BottomNavItemModel> bottomNavItemList = [
    BottomNavItemModel(iconData: Icons.home, label: 'Home', id: 0),
    BottomNavItemModel(iconData: Icons.contact_page, label: 'Contacts', id: 1),
    BottomNavItemModel(iconData: Icons.call, label: 'Calls', id: 2),
    BottomNavItemModel(iconData: Icons.chat, label: 'Chats', id: 3),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  key: locator<AppRouter>().scaffoldKey,
        appBar: AppBar(),
        drawer: SafeArea(child: AppDrawer()),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: AppText(text: S.of(context).hello)),
            AppButton(
              btnTitle: 'Sing In',
              borderRadius: 20.r,
              onClick: () {
                //context.push('/signIn');
                //Utils.showMessage(content: 'test message');
              },
            ),
            20.verticalSpace,
            AppButton(
              btnTitle: 'Sign Up',
              borderRadius: 20.r,
              onClick: () {
                // context.push(
                //   '/signUp',
                // );
                Utils.showCustomBottomModelSheet(
                    child: const Center(
                  child: AppText(
                    text: 'Test',
                  ),
                ));
              },
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // AppDotsIndicator(currentIndex: 0, index: 1),
                // AppDotsIndicator(currentIndex: 2, index: 2),
                // AppDotsIndicator(currentIndex: 0, index: 3),
                // AppDotsIndicator(currentIndex: 0, index: 4),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 60.h,
          padding: EdgeInsets.only(bottom: 12.r),
          child: AppBottomNavigation(
            currentIndex: currentIndex,
            listItems: bottomNavItemList,
            onTap: onBottomNavigationTap,
          ),
        ));
  }

  void onBottomNavigationTap(int tapIndex) {
    setState(() {
      currentIndex = tapIndex;
    });
  }

  void _onSignInClick() {
    // GoRouter.of(context).go("/signIn");
    // locator<AppRouter>().getRoutes.
  }

  void _onSignUpClick() {
    // context.go("/signUp");
  }
}
