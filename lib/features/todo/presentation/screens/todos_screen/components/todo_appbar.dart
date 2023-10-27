import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/date_helper.dart';

class TodoAppbar extends StatelessWidget {
  const TodoAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 33.sp),
            ),
            const Icon(
              Icons.calendar_today_outlined,
              color: Colors.grey,
              size: 20,
            )
          ],
        ),
        Text(
          formatDateTime(DateTime.now().toString()),
          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
        ),
      ],
    );
  }
}
