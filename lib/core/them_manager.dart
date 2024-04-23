import 'package:graduation_project/core/style_manager.dart';
import 'package:flutter/material.dart';

import 'color_manger.dart';
import 'fonts_manger.dart';
import 'value_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main color
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.secondary,

    // card theme
    cardTheme: CardTheme(
      color: ColorManager.surface,
      shadowColor: ColorManager.secondary,
      elevation: AppSize.s4,
    ),

    // app Bar theme
    appBarTheme: AppBarTheme(
      elevation: AppSize.s2,
      color: ColorManager.primary,
      shadowColor: ColorManager.otline,
      centerTitle: true,
      titleTextStyle:
          getRegularStyle(fontSize: AppSize.s16, color: ColorManager.primary),
    ),
    // button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.otline,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primary,
    ),
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegularStyle(color: ColorManager.surface, fontSize: FontSize.s17),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    // text theme
    textTheme: TextTheme(
      displayLarge:
          getLightStyle(color: ColorManager.text, fontSize: FontSize.s16),
      // head line 1
      headlineLarge: getSemiBoldStyle(
          color: ColorManager.surface, fontSize: FontSize.s20),
      headlineMedium:
          getRegularStyle(color: ColorManager.surface, fontSize: FontSize.s14),
      // sub title 1
      titleMedium:
          getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      // caption
      bodyLarge: getRegularStyle(color: ColorManager.text),
      //body text 1
      bodySmall: getRegularStyle(color: ColorManager.text),
    ),
    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      labelStyle:
          getMediumStyle(color: ColorManager.text, fontSize: FontSize.s16),
      hintStyle:
          getRegularStyle(color: ColorManager.secondary, fontSize: FontSize.s16),
      errorStyle: getRegularStyle(
        color: ColorManager.red,
      ),
      // enabled Border
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
      ),

      //////////////////////////////////////////////// focused Border
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
      ),

      ////////////////////////////////////////focused Error Border
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
      ),

      //////////////////////////////////// error Border
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
        borderSide: BorderSide(
          color: ColorManager.red,
          width: AppSize.s1_5,
        ),
      ),
    ),
  );
}
