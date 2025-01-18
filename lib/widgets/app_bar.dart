import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mywc/values/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  BaseAppBar({
    super.key,
    this.title,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevations = 0.0,
    this.action,
    this.leadingIcon = true,
    this.showTitle = false,
    this.backAction,
    this.titleWidget,
    this.leadingWidget,
    this.leadingWidgetColor,
    this.titleWidgetColor,
    this.titleSpacing,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
  }) : assert(title == null || titleWidget == null,
            "Title and Title widget both can't be null");

  late String? title;
  bool centerTitle;
  late Color? backgroundColor = Colors.transparent;
  late double? elevations;
  List<Widget>? action;
  bool leadingIcon;
  bool showTitle;
  Function()? backAction;
  Widget? titleWidget;
  Widget? leadingWidget;
  Color? leadingWidgetColor;
  Color? titleWidgetColor;
  double? titleSpacing;

  @override
  State<BaseAppBar> createState() => _BaseAppBarState();

  @override
  final Size preferredSize;
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Leading Icon: ${widget.leadingIcon}");
    return AppBar(
      titleSpacing: widget.titleSpacing,
      centerTitle: widget.centerTitle,
      title: !widget.showTitle
          ? const SizedBox.shrink()
          : widget.titleWidget ??
              Text(
                widget.title!,
                style: AppStyles.normal10Bold.copyWith(
                    color: widget.titleWidgetColor ?? Colors.transparent),
              ),
      backgroundColor: widget.backgroundColor ?? Colors.transparent,
      elevation: widget.elevations,
      automaticallyImplyLeading: false,
      //brightness: Brightness.dark,
      leading: widget.leadingIcon
          ? widget.leadingWidget ??
              GestureDetector(
                onTap: () {
                  if (widget.backAction != null) {
                    widget.backAction!.call();
                  } else {
                    Navigator.maybePop(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Icon(
                    Icons.arrow_back_ios,
                    //  color: blackColor,
                    size: 24.h,
                  ),
                ),
              )
          : Container(
              color: Colors.red,
            ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: widget.action,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
