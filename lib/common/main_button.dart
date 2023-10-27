import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key, required this.title, required this.icon, this.height = 60, this.onPressed});
  final String title;
  final IconData icon;
  final double height;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: height,
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.defaultColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30).w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25.sp,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
