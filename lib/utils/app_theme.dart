import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLight,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.primaryLight),
    ),
    focusColor: AppColors.whiteColor,
    dividerColor: AppColors.whiteColor,
    indicatorColor: AppColors.grayColor,
    splashColor: AppColors.grayColor,

    scaffoldBackgroundColor: AppColors.whiteBgColor,
    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20Black,
      headlineMedium: AppStyles.medium16White,
      titleMedium: AppStyles.bold16White,
      titleSmall: AppStyles.medium16Black,
      bodyLarge: AppStyles.medium16Gray,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryLight,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor,
      selectedLabelStyle: AppStyles.bold12White,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryLight,
      shape: StadiumBorder(
        side: BorderSide(width: 6, color: AppColors.whiteColor),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.primaryDark,

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.primaryLight),
    ),

    focusColor: AppColors.primaryLight,
    dividerColor: AppColors.primaryLight,
    indicatorColor: AppColors.whiteColor,
    splashColor: AppColors.primaryLight,

    textTheme: TextTheme(
      headlineLarge: AppStyles.bold20White,
      headlineMedium: AppStyles.medium16White,
      titleMedium: AppStyles.bold16PrimaryDark,
      titleSmall: AppStyles.medium16White,
      bodyLarge: AppStyles.medium16White,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDark,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.whiteColor,
      selectedLabelStyle: AppStyles.bold12White,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryDark,
      shape: StadiumBorder(
        side: BorderSide(width: 6, color: AppColors.whiteColor),
      ),
    ),
  );
}
