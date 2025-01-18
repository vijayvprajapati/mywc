//this is custom text widget will use for showing different types of text

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      required this.text,
      this.textStyle,
      this.textAlign,
      this.textColor,
      this.textSize});

  final String text;
  final TextStyle? textStyle;
  final Color? textColor;
  final double? textSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: textStyle ?? TextStyle(color: textColor, fontSize: textSize),
    );
  }
}
