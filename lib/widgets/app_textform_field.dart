//this is custom text field widget will used for adding text field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String? prefixText;
  final String? errorText;
  final String? error;
  final bool obscureText;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final TextInputAction keyboardAction;
  final TextCapitalization textCapitalization;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validators;
  final List<TextInputFormatter>? inputFormatters;
  final InputCounterWidgetBuilder? buildCounter;
  final int? maxLength;
  final Widget? prefixIcon;
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool enableInteractiveSelection;
  final Widget? suffixIcon;
  final String? initValue;
  final FormFieldSetter<String>? onSaved;
  final bool paddingLeft;
  final EdgeInsets? contentPadding;
  final int maxLines;
  final double height;
  final bool filled;
  final Widget? suffix;
  final Widget? prefix;
  final Function(String?)? onChanged;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final bool? isDense;

  const AppTextField({
    required this.label,
    required this.hint,
    this.error,
    this.obscureText = false,
    this.textStyle,
    this.decoration,
    this.keyboardAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.validators,
    this.inputFormatters,
    this.maxLength,
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.onTap,
    this.readOnly = false,
    this.enableInteractiveSelection = true,
    this.suffixIcon,
    this.initValue,
    this.paddingLeft = false,
    this.contentPadding,
    this.prefixIcon,
    this.onSaved,
    this.prefixText,
    this.maxLines = 1,
    this.height = 1,
    this.filled = false,
    this.suffix,
    this.prefix,
    this.onChanged,
    this.errorText,
    this.buildCounter,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.isDense,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initValue,
      onSaved: onSaved,
      //cursorColor: AppColor.primaryColor,
      enableInteractiveSelection: enableInteractiveSelection,
      readOnly: readOnly,
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      minLines: 1,
      maxLines: maxLines,
      style: textStyle,
      obscureText: obscureText,
      validator: validators ??
          (String? value) {
            return null;
          },
      keyboardType: keyboardType,
      textInputAction: keyboardAction,
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      onFieldSubmitted: (_) => submit(context),
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      decoration: decoration ??
          InputDecoration(
            // counterStyle: textMedium.copyWith(
            //   color: AppColor.accentColor.withOpacity(0.50),
            // ),
            counterText: "",
            filled: filled,
            prefixText: prefixText,
            isDense: isDense,
            prefix: prefix,
            // prefixStyle: textMedium.copyWith(color: Colors.black),
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            // fillColor: filled ? AppColor.santasGray : AppColor.santasGray,
            hintText: hint,
            hintMaxLines: 1,
            suffixIcon: suffixIcon,
            suffix: suffix,
            suffixIconConstraints: suffixIconConstraints,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            // hintStyle: textMedium.copyWith(
            //   color: AppColor.santasGray,
            //   fontSize: 15.spMin,
            // ),
            // errorStyle: textMedium.copyWith(color: AppColor.red),
            errorMaxLines: 2,
            alignLabelWithHint: true,
            contentPadding:
                contentPadding ?? const EdgeInsets.fromLTRB(12, 18, 12, 18),
            focusedBorder: OutlineInputBorder(
              //borderRadius: BorderRadius.circular(kBorderRadius),
              borderSide: filled
                  ? BorderSide.none
                  : BorderSide(
                      // color: AppColor.santasGray.withOpacity(0.5),
                      ),
            ),
            enabledBorder: OutlineInputBorder(
              //  borderRadius: BorderRadius.circular(kBorderRadius),
              borderSide: filled
                  ? BorderSide.none
                  : BorderSide(
                      //  color: AppColor.santasGray.withOpacity(0.5),
                      ),
            ),
            errorBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(kBorderRadius),
              borderSide: filled
                  ? BorderSide.none
                  : const BorderSide(
                      // color: AppColor.red,
                      ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              // borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            focusedErrorBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.circular(kBorderRadius),
              borderSide: filled
                  ? BorderSide.none
                  : BorderSide(
                      // color: AppColor.santasGray.withOpacity(0.5),
                      ),
            ),
          ),
    );
  }

  void submit(BuildContext context) {
    switch (keyboardAction) {
      case TextInputAction.done:
        FocusScope.of(context).unfocus();
        break;
      case TextInputAction.next:
        FocusScope.of(context).requestFocus(nextFocusNode);
        break;
      default:
        FocusScope.of(context).nextFocus();
        break;
    }
  }
}
