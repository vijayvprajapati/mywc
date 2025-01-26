import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mywc/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImage extends StatefulWidget {
  final String? url;
  final String? file;
  final String? assets;
  final String? initial;
  final double radius;
  final Color? backgroundColor;
  final Color borderColor;
  final double boarderWidth;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final double? roundedCorner;
  final Widget? placeHolder;
  final BoxFit? boxFit;
  final bool isSvg;

  const AppImage({
    this.url,
    this.boxFit,
    this.file,
    this.height,
    this.width,
    this.assets,
    this.initial,
    this.radius = 1,
    this.placeHolder,
    this.roundedCorner,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.boarderWidth = 3.0,
    this.textStyle,
    this.isSvg = true,
    super.key,
  });

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        // for rounded corner
        child: widget.url != null
            ? CachedNetworkImage(
                //cacheKey: Uri.parse(widget.url).pathSegments.last,
                imageUrl: widget.url!,
                height: widget.height ?? widget.radius * 2,
                width: widget.width ?? widget.radius * 2,
                fit: widget.boxFit ?? BoxFit.cover,
                placeholder: (context, url) => placeholder,
                errorWidget: (context, url, error) => initialPlaceholder,
              )
            : widget.file != null
                ? Image(
                    image: FileImage(File(widget.file!)),
                    fit: BoxFit.cover,
                    height: widget.radius * 2,
                    width: widget.radius * 2,
                  )
                : widget.assets != null && !widget.isSvg
                    ? Image.asset(
                        widget.assets!,
                        fit: BoxFit.scaleDown,
                        height: widget.height ?? widget.radius * 2,
                        width: widget.width ?? widget.radius * 2,
                      )
                    : SvgPicture.asset(widget.assets!, height: widget.height ?? widget.radius * 2, width: widget.width ?? widget.radius * 2)
        //: initialPlaceholder,
        );
  }

  Widget get placeholder {
    if (widget.placeHolder != null) return widget.placeHolder!;
    return widget.initial != null
        ? initialPlaceholder
        : AspectRatio(
            aspectRatio: 1.5,
            child: Transform.scale(
              scale: 0.5,
              child: const CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.toolbarColor),
              ),
            ),
          );
  }

  Container get initialPlaceholder => Container(
        height: widget.radius * 2,
        width: widget.radius * 2,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(widget.radius),
          ).r,
          border: Border.all(
            width: widget.boarderWidth,
            color: widget.borderColor,
          ),
        ),
        child: Center(
          child: Text(
            getText,
            style: widget.textStyle,
          ),
        ),
      );

  String get getText {
    if (widget.initial == null) {
      return "";
    } else if (widget.initial!.isEmpty) {
      return "";
    } else {
      return widget.initial![0];
    }
  }
}
