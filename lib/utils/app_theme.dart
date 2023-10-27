import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/app_colors.dart';

ThemeData appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.defaultColor),
    useMaterial3: true,
    textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    checkboxTheme: const CheckboxThemeData(fillColor: MaterialStatePropertyAll(Colors.black)),
    tabBarTheme: TabBarTheme(
        dividerColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: AppColors.defaultColor,
        unselectedLabelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        indicator: BoxDecoration(
            color: const Color(0xffD5DBFB), borderRadius: BorderRadius.circular(30).w)));
