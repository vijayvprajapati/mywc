//common bottom sheet for app use with child
import 'package:flutter/material.dart';
import 'package:mywc/util/extension/context.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 35.sh,
      padding: EdgeInsets.only(left: 10.r, right: 10.r),
      decoration: BoxDecoration(
          color: const Color(0xffF6F6F6),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      child: Column(
        children: [
          Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 4,
                width: 40,
                margin: EdgeInsets.only(top: 10.r),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ],
          ),
          InkWell(
            onTap: () {
             
            },
            child: const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.close,
                  size: 25,
                )),
          ),
          10.verticalSpace,
          Expanded(
            child: Container(
              width: context.width,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.r)),
              ),
              child: child,
            ),
          ),
          50.verticalSpace,
        ],
      ),
    );
  }
}
