import 'package:calender/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class TodayBanner extends StatelessWidget {
  final DateTime selectedDay;
  final int scheduleCount;

  const TodayBanner(
      {required this.selectedDay, required this.scheduleCount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle =
        TextStyle(color: Colors.white, fontWeight: FontWeight.w600);

    return Container(
      decoration: BoxDecoration(color: PrimaryColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                style: defaultTextStyle,
                '${selectedDay.year}년 ${selectedDay.month}월 ${selectedDay.day}일'),
            Text(style: defaultTextStyle, '${scheduleCount}개')
          ],
        ),
      ),
    );
  }
}
