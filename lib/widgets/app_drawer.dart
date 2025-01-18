import 'package:flutter/material.dart';
import 'package:mywc/locator/locator.dart';
import 'package:mywc/router/app_router.dart';
import 'package:mywc/values/colors.dart';
import 'package:mywc/widgets/app_alert_dialog.dart';
import 'package:mywc/widgets/app_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  List<String> _drawerList = [
    'Home',
    'Alert dialog',
    'Snabbar',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 0.20.sh,
              width: 1.sw,
              color: AppColors.blue,
              padding: EdgeInsets.only(left: 15.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle_outlined,
                    size: 60,
                  ),
                  10.verticalSpace,
                  const AppText(
                    text: 'Vijay Prajapati',
                    textColor: AppColors.white,
                  ),
                  10.verticalSpace,
                  const AppText(
                    text: 'vijay@gmail.com',
                    textColor: AppColors.white,
                  ),
                ],
              )),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: _drawerList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _onDrawerItemTap(index: index);
                    },
                    child: ListTile(
                      title: Row(
                        children: [
                          const Icon(Icons.home),
                          10.horizontalSpace,
                          AppText(text: _drawerList[index]),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  void _onDrawerItemTap({required int index}) {
    switch (index) {
      case 0:
        //navigate to desire screen
        break;
      case 1:
        closeDrawer();
        // showDialog(
        //     context: locator<AppRouter>().navigatorKey.currentState!.context,
        //     builder: (context) {
        //       return AppAlertDialog(
        //         title: 'Flutter bloc',
        //         subTitle: 'Are you sure want to use flutter bloc?',
        //         buttonOkText: 'OK',
        //         buttonCancelText: 'Cancel',
        //         onTapOkCallback: () {
                 
        //         },
        //       );
        //     });
        break;
      default:
    }
  }

  void closeDrawer() {
   // locator<AppRouter>().scaffoldKey.currentState?.closeDrawer();
  }
}
