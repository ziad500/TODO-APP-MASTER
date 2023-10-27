import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';

ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.defaultColor),
    useMaterial3: true,
    checkboxTheme: const CheckboxThemeData(fillColor: MaterialStatePropertyAll(Colors.black)),
    tabBarTheme: TabBarTheme(
        dividerColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.defaultColor,
        unselectedLabelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        indicator: BoxDecoration(
            color: const Color(0xffD5DBFB), borderRadius: BorderRadius.circular(30))));
