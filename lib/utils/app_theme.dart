import 'package:flutter/material.dart';
import 'package:themeandlanguage/utils/app_color.dart';
import 'package:themeandlanguage/utils/app_text_styles.dart';

class AppTheme {

  static  ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColor.primaray,
        onPrimary: AppColor.onprimaray,
        secondary: AppColor.secandrylight,
        onSecondary: AppColor.onsecandrylight,
        error: AppColor.errorlight,
        onError: AppColor.onprimaray,
        surface: AppColor.surfacelight,
        onSurface: AppColor.onsurfacelight),
    buttonTheme: ButtonThemeData(),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.headine!.copyWith(color:AppColor.primaray )
      ),
  );

  static  ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColor.primaray,
        onPrimary: AppColor.onprimaray,
        secondary: AppColor.secandrydark,
        onSecondary: AppColor.onsecandrylight,
        error: AppColor.errordark,
        onError: AppColor.onprimaray,
        surface: AppColor.surfacedark,
        onSurface: AppColor.onsurfacedark),
    textTheme: TextTheme(
        displayLarge: AppTextStyles.headine!.copyWith(color:AppColor.onprimaray )
    ),
  );
}