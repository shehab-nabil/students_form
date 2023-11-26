import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: AppColor.primaryColor,
    disabledColor: AppColor.grey,
    splashColor: AppColor.primaryColor,
    //   app bar theme
    appBarTheme: AppBarTheme(
      color: AppColor.white,
      elevation: 4,
      //  shadowColor: ColorManager.lightPrimary,
      titleTextStyle: TextStyle(
          color: AppColor.black, fontSize: 26, fontWeight: FontWeight.w500),
    ),

    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: AppColor.grey,
        buttonColor: AppColor.primaryColor,
        splashColor: AppColor.darkGrey),
    // text theme
    textTheme: TextTheme(
        headlineLarge: TextStyle(
            color: AppColor.black, fontSize: 26, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(color: AppColor.black, fontSize: 26),
        bodySmall:
            TextStyle(color: AppColor.black.withOpacity(.55), fontSize: 18)),

    //input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: AppColor.primaryColor,
        // content padding
        contentPadding: const EdgeInsets.all(8),
        // hint style
        hintStyle: TextStyle(color: AppColor.grey, fontSize: 14),
        labelStyle: TextStyle(color: AppColor.grey, fontSize: 14),
        errorStyle: const TextStyle(color: Colors.red),

        //enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.grey, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(8))),

        // error border style
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.primaryColor, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(8)))),
  );
}
