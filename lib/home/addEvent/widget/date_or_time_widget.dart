import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateOrTimeWidget extends StatelessWidget {
  final String iconName;
  final String eventDateOrTime;
  final String ChooseDateOrTime;

  final VoidCallback OnChooseEventOrDate;

  const DateOrTimeWidget({
    super.key,
    required this.iconName,
    required this.eventDateOrTime,
    required this.OnChooseEventOrDate,
    required this.ChooseDateOrTime,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Image.asset(iconName),
        SizedBox(width: width * 0.04),
        Text(eventDateOrTime, style: Theme.of(context).textTheme.titleSmall),
        Spacer(),
        TextButton(
          onPressed: OnChooseEventOrDate,
          child: Text(ChooseDateOrTime, style: AppStyles.medium16primary),
        ),
      ],
    );
  }
}
