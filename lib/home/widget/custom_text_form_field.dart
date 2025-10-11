import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

typedef OnValidator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  Color borderSideColor;
  String? hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Widget? prifixIcon;
  Widget? suffixIcon;
  OnValidator? validator;
  TextInputType? keyboardType;
  bool obscureText;
  TextEditingController? controller;
  int? maxLines;

  CustomTextFormField({
    super.key,
    this.borderSideColor = AppColors.grayColor,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prifixIcon,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.controller,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: builtDecorationBorder(borderSideColor: borderSideColor),
        focusedBorder: builtDecorationBorder(borderSideColor: borderSideColor),
        errorBorder: builtDecorationBorder(borderSideColor: AppColors.redColor),
        focusedErrorBorder: builtDecorationBorder(
          borderSideColor: AppColors.redColor,
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? AppStyles.medium16Gray,
        labelText: labelText,
        labelStyle: labelStyle ?? AppStyles.medium16Gray,
        prefixIcon: prifixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }

  OutlineInputBorder builtDecorationBorder({required Color borderSideColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: borderSideColor, width: 1),
    );
  }
}
