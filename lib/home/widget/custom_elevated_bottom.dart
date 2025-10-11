import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedBottom extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text;
  final Color? backgroundColor;

  final Color? borderColor;

  final textStyle;
  final bool hasIcon;
  final Widget? ChildIconWidget;

  const CustomElevatedBottom({
    super.key,
    required this.onPressed,
    this.text,
    this.backgroundColor = AppColors.primaryLight,
    this.borderColor = AppColors.transparentColor,
    this.textStyle,
    this.hasIcon = false,
    this.ChildIconWidget,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(width: 2, color: borderColor!),
        ),
      ),
      onPressed: onPressed,
      child: hasIcon
          ? ChildIconWidget
          : Text(text ?? '', style: textStyle ?? AppStyles.medium20White),
    );
  }
}

/*
Row(
              mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.start,
              children: [
                iconWidget?? SizedBox(),
                SizedBox(
                  width: widht*0.04,
                ),
                Text(text,
                  style: textStyle??AppStyles.medium20White,)

              ],
            )
 */
