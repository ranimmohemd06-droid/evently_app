import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventTabTitle extends StatelessWidget {
  final bool isSelected;
  final String eventName;
  final Color selectedBgColor;
  final TextStyle selectedTextStyle;
  final TextStyle UnselectedTextStyle;
  final Color boarderColor;

  const EventTabTitle({
    super.key,
    required this.isSelected,
    required this.eventName,
    required this.selectedBgColor,
    required this.selectedTextStyle,
    required this.UnselectedTextStyle,
    required this.boarderColor,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var widht = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widht * 0.04,
        vertical: height * 0.004,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: widht * 0.01,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color: isSelected ? selectedBgColor : AppColors.transparentColor,
        border: Border.all(color: boarderColor, width: 2),
      ),
      child: Text(
        eventName,
        style: isSelected ? selectedTextStyle : UnselectedTextStyle,
      ),
    );
  }
}
